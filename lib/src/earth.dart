import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'package:earth_kit/src/topo_parser.dart';

import 'canvas/renderer.dart';
import 'earth_data.dart';
import 'model/model.dart';
import 'projection/projection.dart';
import 'util/util.dart';
import 'widgets/widgets.dart';

part 'earth_camera.dart';
part 'earth_overlay.dart';

typedef EarthKitRenderFactory = List<Renderable> Function(EarthState state);

typedef OnEarthTapCallback = void Function(LatLng? latLng);

typedef OnCountryTapCallback = void Function(LatLng? latLng, Country country);

class EarthKit extends ImplicitAnimation {
  final bool expand;
  final Curve cameraCurve;
  final Projection projection;
  final EarthTheme theme;
  final OnEarthTapCallback? onTap;
  final OnCountryTapCallback? onCountryTap;
  final OnEarthTapCallback? onLongPress;
  final Set<LatLng> points;
  final List<Graticule> graticules;
  final List<Polyline> polylines;
  final List<Polygon> polygons;
  final List<EarthItem> items;
  final List<Heatmap> heatmaps;
  final List<Country> countries;
  final EarthKitRenderFactory? renderer;
  final CameraSpec cameraSpec;
  final List<Topography> topographies;
  final bool layerFillAndStroke;
  EarthKit({
    Key? key,
    Duration duration = const Duration(milliseconds: 1000),
    EarthTheme? theme,
    List<Topography> topographies = Topography.defaults,
    this.expand = false,
    this.cameraCurve = Curves.ease,
    Projection? projection,
    this.onTap,
    this.onCountryTap,
    this.onLongPress,
    this.points = const {},
    List<Polyline> polylines = const [],
    List<Polygon> polygons = const [],
    List<Graticule> graticules = const [],
    this.items = const [],
    this.heatmaps = const [],
    this.countries = Countries.all,
    this.renderer,
    this.cameraSpec = const CameraSpec(),
    this.layerFillAndStroke = false,
  })  : topographies = List.from(topographies)..sort((a, b) => a.zoom.compareTo(b.zoom)),
        projection = projection ?? Projections.equirectangular,
        theme = theme ?? EarthTheme(),
        polygons = (theme ?? EarthTheme()).polygonTheme.applyToPolygons(polygons),
        polylines = (theme ?? EarthTheme()).polygonTheme.applyToPolylines(polylines),
        graticules = (theme ?? EarthTheme()).graticuleTheme.applyTo(graticules),
        assert(topographies.isNotEmpty),
        super(key, duration, Curves.linear);

  static bool debugDragAdaptiveResample = false;

  static EarthKit? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<EarthKit>();

  @override
  _EarthState createState() => _EarthState();
}

class _EarthState extends ImplicitAnimationState<EarthData, EarthKit> {
  List<Topo> topos = [];
  bool get isLoaded => topos.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loadTopology();
  }

  @override
  void didUpdateWidget(EarthKit oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!listEquals(widget.topographies, oldWidget.topographies)) {
      _loadTopology();
    }
  }

  Future<void> _loadTopology() async {
    topos = await parseTopology(widget.topographies);
    setState(() {});
  }

  double get aspectRatio => widget.projection.aspectRatio;

  @override
  Widget builder(BuildContext context, EarthData? data) {
    return RepaintBoundary(
      child: _EarthCamera(
        options: data!.options,
        builder: (camera, snapshot) {
          final state = EarthState(
            earth: widget,
            topos: topos,
            data: data,
            camera: camera,
            snapshot: snapshot,
          );

          final earth = Transform.rotate(
            angle: camera.rotation!,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: createStackedPainters(state),
            ),
          );

          if (widget.expand) {
            return earth;
          } else {
            return AspectRatio(
              aspectRatio: widget.projection.aspectRatio,
              child: earth,
            );
          }
        },
      ),
    );
  }

  List<Widget> createStackedPainters(EarthState state) {
    final List<Renderable> defaultRenderer = [
      AstroRenderer(state),
      OceanRenderer(state),
      // GLTopoRenderer(state: state),
      ...widget.layerFillAndStroke
          ? [TopographyRenderer.fill(state), TopographyRenderer.outline(state)]
          : [TopographyRenderer(state)],
      // GraticuleRenderer(state),
      // ShapesRenderer(state),
      ProjectionOutlineRenderer(state)
    ];

    List<Renderable> renderer = widget.renderer?.call(state) ?? [];

    final heatmaps = widget.heatmaps
        .map((heatmap) => HeatmapRenderer(state: state, heatmaps: [heatmap]))
        .toList();

    renderer = (defaultRenderer + renderer)
      ..addAll(heatmaps)
      ..sortBy([(z) => z.zIndex]);

    return renderer.map((renderer) {
      final painter = renderer is KRenderer
          ? CustomPaint(
              painter: renderer as KRenderer,
            )
          : renderer;

      if (renderer.projectionDependent) {
        Widget renderer = AspectRatio(
          aspectRatio: aspectRatio,
          child: painter as Widget?,
        );

        if (state.camera.allowUserZoom) {
          renderer = OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: Center(
              child: SizedBox.fromSize(
                size: state.snapshot.size,
                child: renderer,
              ),
            ),
          );
        }

        return renderer;
      } else {
        return painter as Widget;
      }
    }).toList();
  }

  @override
  EarthData get newValue => EarthData(
        theme: widget.theme,
        options: widget.cameraSpec,
      );

  @override
  EarthData lerp(EarthData? a, EarthData b, double t) =>
      a!.scaleTo(b, t, curve: widget.curve, cameraCurve: widget.cameraCurve);
}
