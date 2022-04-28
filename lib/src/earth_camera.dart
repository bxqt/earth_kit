part of 'earth.dart';

class _EarthCamera extends StatefulWidget {
  final CameraSpec options;
  final Widget Function(CameraSpec camera, EarthSnapshot snapshot) builder;
  const _EarthCamera({
    Key? key,
    required this.options,
    required this.builder,
  }) : super(key: key);

  @override
  _EarthCameraState createState() => _EarthCameraState();
}

class _EarthCameraState extends State<_EarthCamera> with SingleTickerProviderStateMixin {
  late AnimationController flingController;

  late double width;
  late double height;

  double? zoom;
  double? rotation;
  LatLng? origin;
  BBox? bounds;
  Rect? visible;

  bool isMoving = false;
  double? zoomStart;
  double? rotationStart;
  Offset panStart = Offset.zero;
  Offset? tapOffset;
  Offset? velocity;

  double? lv = 0.0;

  CameraSpec get camera => widget.options;
  EarthKit? get earth => EarthKit.of(context);
  Projection get projection => earth!.projection;

  bool get isPanEnabled => camera.allowUserPan;
  bool get isZoomEnabled => camera.allowUserZoom;
  bool get isRotationEnabled => camera.allowUserRotation;

  Size get parentSize => Size(width, height);
  Size get scaledSize => Size(width * zoom!, height * zoom!);

  @override
  void initState() {
    super.initState();

    flingController = AnimationController.unbounded(
      vsync: this,
    )..addListener(() {
        if (velocity == null) return;

        final value = flingController.value;
        lv ??= value;

        final delta = value - lv!;

        final x = (velocity!.dx * -1) * delta;
        final y = (velocity!.dy * -1) * delta;

        onMove(Offset.zero, x, y);
        setState(() {});

        lv = value;
      });

    zoom = camera.zoom;
    rotation = camera.rotation;
    origin = camera.origin;

    postFrame(adjustCameraPosition);
  }

  @override
  void didUpdateWidget(_EarthCamera oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!isZoomEnabled || camera.zoom != oldWidget.options.zoom) {
      zoom = camera.zoom;
    }

    if (!isRotationEnabled || camera.rotation != oldWidget.options.rotation) {
      rotation = camera.rotation;
    }

    if (!isPanEnabled || camera.origin != oldWidget.options.origin) {
      origin = camera.origin;
      clearProjectionCache();
    }

    adjustCameraPosition();
  }

  void stopAnimation() {
    flingController.stop();
    velocity = null;
    lv = null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.biggest.width;
        height = constraints.biggest.height;

        if (projection.size == null) {
          adjustCameraPosition();
        }

        return Listener(
          onPointerDown: (event) => tapOffset = event.localPosition,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: widget.builder(
              camera.copyWith(
                origin: origin,
                rotation: rotation,
                zoom: zoom,
              ),
              EarthSnapshot(
                origin: origin,
                zoom: zoom,
                size: size,
                bbox: camera.bbox,
                bounds: BBox.world,
                visible: visible,
                parentSize: parentSize,
                isMoving: isMoving || flingController.isAnimating,
              ),
            ),
            onTap: earth!.onTap != null || earth!.onCountryTap != null
                ? () => invokeTapCallback()
                : null,
            onLongPress:
                earth!.onLongPress != null ? () => invokeTapCallback(onTap: false) : null,
            onScaleStart: (details) {
              panStart = details.focalPoint;
              rotationStart = rotation;
              zoomStart = zoom;
              isMoving = true;
              stopAnimation();
            },
            onScaleUpdate: (details) {
              final point = details.focalPoint;

              final xDelta = panStart.dx - point.dx;
              final yDelta = panStart.dy - point.dy;
              onMove(details.localFocalPoint, xDelta, yDelta);

              final zDelta = details.scale - 1.0;
              onZoom(zDelta);

              final rDelta = details.rotation;
              onRotate(rDelta);

              panStart = details.focalPoint;
              setState(() {});
            },
            onScaleEnd: (details) {
              isMoving = false;
              velocity = details.velocity.pixelsPerSecond;

              flingController.animateWith(
                FrictionSimulation(
                  0.005,
                  0,
                  velocity!.distance / 1500,
                  tolerance: const Tolerance(velocity: 0.025),
                ),
              );
              setState(() {});
            },
          ),
        );
      },
    );
  }

  void calculateVisibleArea() {
    final parentWidth = parentSize.width;
    final leftOverflow = (size.width - parentWidth).atLeast(0.0) / 2.0;

    final parentHeight = parentSize.height;
    final topOverflow = (size.height - parentHeight).atLeast(0.0) / 2.0;

    visible = Rect.fromLTWH(
      leftOverflow,
      topOverflow,
      math.min(parentWidth, size.width),
      math.min(parentHeight, size.height),
    );
  }

  Offset toVisible(Offset offset) {
    return Offset(offset.dx - visible!.left, offset.dy - visible!.top);
  }

  void calculateViewBounds() {
    final coordinates = [
      visible!.topLeft,
      visible!.topCenter,
      visible!.topRight,
      visible!.centerLeft,
      visible!.centerRight,
      visible!.bottomLeft,
      visible!.bottomCenter,
      visible!.bottomRight,
    ].map(invert).toList();

    if (coordinates.any((coord) => coord == null)) {
      bounds = BBox.world;
      return;
    }

    double? left, top, right, bottom;
    for (final coord in coordinates) {
      final lat = coord!.latitude;
      final lon = coord.longitude;
      if (left == null || lon < left) left = lon;
      if (right == null || lon > right) right = lon;
      if (top == null || top < lat) top = lat;
      if (bottom == null || bottom > lat) bottom = lat;
    }

    bounds = BBox(
      LatLng(bottom!, left!),
      LatLng(top!, right!),
    );
  }

  void onMove(Offset focal, double xDelta, double yDelta) {
    if (!isPanEnabled) return;

    final radius = projection.isGlobe ? 180.0 : 360.0;

    final xRadius = () {
      final right = visible!.centerRight;
      final left = visible!.centerLeft;

      if (visible!.width < size.width && projection.areInsideBounds([right, left])) {
        final rightLon = invert(right)!.longitude;
        final leftLon = invert(left)!.longitude;

        if (leftLon < rightLon) {
          return rightLon - leftLon;
        } else {
          return (radius - leftLon) + (radius + rightLon);
        }
      } else {
        return radius;
      }
    }();

    final yRadius = () {
      final top = visible!.topCenter;
      final bottom = visible!.bottomCenter;

      if (visible!.height < size.height && projection.areInsideBounds([bottom, top])) {
        final t = invert(top)!;
        final topLat = t.latitude;
        final b = invert(bottom)!;
        final bottomLat = b.latitude;
        final areOnTheSameGlobeSide = (t.longitude - b.longitude).abs() < 180.0;

        if (areOnTheSameGlobeSide) {
          return topLat - bottomLat;
        } else {
          if (t.longitude == origin!.longitude) {
            return (90.0 - bottomLat.abs()) + (90 + topLat);
          } else {
            return (90.0 - topLat.abs()) + (90 - bottomLat);
          }
        }
      } else {
        return radius;
      }
    }();

    final xDeltaF = xDelta / math.min(width, size.width);
    final yDeltaF = yDelta / math.min(height, size.height);

    final lonDelta = xRadius * xDeltaF;
    final latDelta = -yRadius * yDeltaF;

    final longitude = (origin!.longitude + lonDelta).wrapAt(-180.0, 180.0);
    final latitude = origin!.latitude + latDelta;

    origin = LatLng.clamp(latitude, longitude);

    adjustCameraPosition();
  }

  void onZoom(double delta) {
    if (!isZoomEnabled || delta == 0.0) return;

    final f = 1.0 + ((zoom! / 20.0) * (delta.isNegative ? 25.0 : 7.5));

    zoom = zoomStart! + (delta * f);
    zoom = zoom!.clamp(camera.minZoom!, camera.maxZoom!);
  }

  void onRotate(double delta) {
    if (isRotationEnabled) {
      rotation = rotationStart! + delta;
    }
  }

  void adjustCameraPosition() {
    projection
      ..origin = origin!
      ..size = Size(
        size.height * projection.aspectRatio,
        size.height,
      );

    calculateVisibleArea();
    // calculateViewBounds();
    clearProjectionCache();
  }

  void invokeTapCallback({bool onTap = true}) {
    if (tapOffset == null) return;

    final swidth = size.width / 2.0;
    final sheight = size.height / 2.0;

    final centerX = width / 2.0;
    final centerY = height / 2.0;

    final isOutsideHorizontalBounds =
        tapOffset!.dx < (centerX - swidth) || tapOffset!.dx > (centerX + swidth);
    final isOutsideVerticalBounds =
        tapOffset!.dy < (centerY - sheight) || tapOffset!.dy > (centerY + sheight);

    if (isOutsideHorizontalBounds || isOutsideVerticalBounds) {
      return;
    }

    final dx = tapOffset!.dx;
    final dy = tapOffset!.dy - ((height / 2.0) - sheight);
    final offset = Offset(dx, dy);

    if (!projection.isInsideBounds(offset)) {
      return;
    }

    final latLng = invert(offset);
    final dynamic country = null;

    if (onTap) {
      earth!.onTap?.call(latLng);

      if (country != null) {
        earth!.onCountryTap?.call(latLng, country);
      }
    } else {
      earth!.onLongPress?.call(latLng);
    }
  }

  Size get size => Size(scaledSize.width, scaledSize.width * projection.aspectRatio);

  LatLng? invert(Offset offset) => projection.invert(offset);
  bool inBounds(Offset offset) => projection.isInsideBounds(offset);

  @override
  void dispose() {
    flingController.dispose();
    super.dispose();
  }
}
