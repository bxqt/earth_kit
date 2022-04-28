part of 'earth.dart';

class EarthOverlay extends StatelessWidget {
  final CameraSpec cameraOptions;
  final List<EarthItem> items;
  const EarthOverlay({
    Key? key,
    required this.cameraOptions,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final earth = EarthKit.of(context)!;
    final projection = earth.projection;
    final rotation = cameraOptions.rotation;

    final items = List<EarthItem>.from(this.items)..sortBy([(item) => item.zIndex]);

    Widget buildItem(EarthItem item) {
      final offset = projection.project(item.latLng);
      final isVisible = !projection.shouldClip(item.latLng);

      final child = item.builder?.call(context, isVisible) ??
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 1.0 : 0.0,
            child: item.child,
          );

      return Transform.translate(
        offset: offset,
        child: Transform.rotate(
          angle: -rotation!,
          child: child,
        ),
      );
    }

    return Stack(
      children: items.map(buildItem).toList(),
    );
  }
}

class EarthItem {
  final double zIndex;
  final LatLng latLng;
  final Widget? child;
  final Widget Function(BuildContext context, bool isVisible)? builder;
  const EarthItem({
    this.zIndex = 1.0,
    required this.latLng,
    this.child,
    this.builder,
  })  : 
        assert(child != null || builder != null);

  @override
  String toString() => 'EarthItem(zIndex: $zIndex, latLng: $latLng, child: $child)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EarthItem && o.zIndex == zIndex && o.latLng == latLng && o.child == child;
  }

  @override
  int get hashCode => zIndex.hashCode ^ latLng.hashCode ^ child.hashCode;
}
