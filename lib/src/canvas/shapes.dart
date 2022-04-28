part of 'renderer.dart';

/// Work in progress...
class GLTopoRenderer extends StatelessWidget with Renderable {
  final EarthState state;
  GLTopoRenderer({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  double get zIndex => 2.0;

  @override
  bool get projectionDependent => !Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    if (state.isReady) {
      return PolygonRenderer(
        state: state,
        zIndex: zIndex,
        polygons: createPolygons(),
      );
    } else {
      return const SizedBox();
    }
  }

  List<Polygon> createPolygons() {
    final topo = state.topo!;
    final theme = state.earth.theme;
    final countryTheme = theme.countryTheme;

    final coastlinePolygons = MultiPolygon(
      id: 'coastline',
      shapes: topo.coastline,
      color: countryTheme.defaultStyle.color,
      strokeColor: countryTheme.defaultStyle.borderColor,
      strokeWidth: countryTheme.defaultStyle.borderWidth,
    );

    return [
      ...coastlinePolygons,
    ];
  }
}

class PolygonRenderer extends StatelessWidget with Renderable {
  final EarthState state;
  final List<Polygon> polygons;
  PolygonRenderer({
    Key? key,
    required this.state,
    required this.zIndex,
    this.polygons = const [],
  }) : super(key: key);

  @override
  final double zIndex;

  @override
  bool get projectionDependent => !Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return buildOpenGLRenderer(context);
    } else {
      return buildFlutterRenderer();
    }
  }

  Widget buildOpenGLRenderer(BuildContext context) {
    return _OpenGLPolygonRenderer(
      state: state,
      polygons: polygons,
    );
  }

  Widget buildFlutterRenderer() {
    return Container();
  }
}

class _OpenGLPolygonRenderer extends StatefulWidget {
  final EarthState state;
  final List<Polygon> polygons;
  const _OpenGLPolygonRenderer({
    Key? key,
    required this.state,
    required this.polygons,
  }) : super(key: key);

  @override
  _OpenGLPolygonRendererState createState() => _OpenGLPolygonRendererState();
}

class _OpenGLPolygonRendererState extends State<_OpenGLPolygonRenderer> {
  Map<String, dynamic> polygonData = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pushData(added: widget.polygons);
  }

  @override
  void didUpdateWidget(_OpenGLPolygonRenderer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!listEquals(widget.polygons, oldWidget.polygons)) {
      final List<Polygon> added = [];
      final List<Polygon> morphed = [];
      final List<Polygon> updated = [];
      final List<Polygon> removed = [];

      final oldMap = Map<String?, Polygon>.fromIterable(
        oldWidget.polygons,
        key: (p) => p.id,
      );

      final newMap = Map<String?, Polygon>.fromIterable(
        widget.polygons,
        key: (p) => p.id,
      );

      newMap.forEach((id, polygon) {
        if (!oldMap.containsKey(id)) {
          added.add(polygon);
        } else {
          final oldPolygon = oldMap[id];

          if (polygon != oldPolygon) {
            if (polygon.coordinates != oldPolygon!.coordinates) {
              morphed.add(polygon);
            } else {
              updated.add(polygon);
            }
          }
        }
      });

      oldMap.forEach((id, polygon) {
        if (!newMap.containsKey(id)) {
          removed.add(polygon);
        }
      });

      pushData(
        added: added,
        morphed: morphed,
        updated: updated,
        removed: removed,
      );
    }
  }

  void pushData({
    List<Polygon> added = const [],
    List<Polygon> morphed = const [],
    List<Polygon> updated = const [],
    List<Polygon> removed = const [],
  }) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;

    List mapPolygons(List<Polygon> polygons) {
      return polygons.map((p) {
        return {
          'id': p.id,
          // Map the coordinates into radians to save us valuable GPU time.
          'vertices': p.map((coord) => coord.toRadians().toMap()).toList(),
          'colorVec': p.color!.vec4,
          'strokeColorVec': p.strokeColor!.vec4,
          'strokeWidth': p.strokeWidth! * pixelRatio,
        };
      }).toList();
    }

    polygonData = {
      'added': mapPolygons(added),
      'morphed': mapPolygons(morphed),
      'updated': mapPolygons(updated),
      'removed': mapPolygons(removed),
    };
  }

  @override
  Widget build(BuildContext context) {
    return OpenGLTexture(
      id: 'polygon',
      state: widget.state,
      data: polygonData,
    );
  }
}

class ShapesRenderer extends KRenderer with Renderable {
  ShapesRenderer(EarthState state) : super(state);

  final Paint pt = Paint();

  @override
  double get zIndex => 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    // clipProjection();

    drawPolylines();
    drawPolygons();
  }

  void drawPolygons() {
    earth.polygons.forEach(drawPolygon);
  }

  void drawPolygon(Polygon polygon) {
    final theme = this.theme.polygonTheme;
    final path = resampledPath(polygon)..close();

    drawFill(path, polygon.color ?? theme.color);
    drawStroke(
      path,
      polygon.strokeColor ?? theme.strokeColor,
      polygon.strokeWidth ?? theme.strokeWidth,
    );
  }

  void drawPolylines() {
    final polylines = earth.polylines.filter((item) => item is! Graticule);
    polylines.forEach(drawPolyline);
  }

  void drawPolyline(Polyline line) {
    final theme = this.theme.polygonTheme;
    final path = resampledPath(line.coordinates);

    drawStroke(
      path,
      line as Color? ?? theme.strokeColor,
      line.strokeWidth ?? theme.strokeWidth,
    );
  }
}
