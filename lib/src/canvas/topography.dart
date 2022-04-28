part of 'renderer.dart';

class OceanRenderer extends KRenderer with Renderable {
  OceanRenderer(EarthState state) : super(state);

  @override
  double get zIndex => 0.0;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);
    clipProjection();
    drawWater();
  }

  void drawWater() {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = theme.waterColor,
    );
  }

  @override
  bool shouldRepaint(OceanRenderer oldDelegate) => false;
}

class TopographyRenderer extends KRenderer with Renderable {
  final bool outline;
  final bool fill;
  TopographyRenderer(
    EarthState state, {
    this.outline = true,
    this.fill = true,
  }) : super(state);

  TopographyRenderer.fill(EarthState state) : this(state, outline: false);
  TopographyRenderer.outline(EarthState state) : this(state, fill: false);

  @override
  double get zIndex => !fill ? 2.0 : 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    if (isLoaded) {
      drawLand();
      drawCountries();
      drawRivers();
      drawLakes();
    }
  }

  void drawLand() {
    final countryStyle = theme.countryTheme.defaultStyle;
    final coastlineStyle = theme.coastlineStyle;

    Path land;
    if (fill && (countryStyle.hasFill || countryStyle.hasShadow)) {
      land = createPathForShapes(topo!.coastline);

      if (countryStyle.hasShadow) {
        drawElevation(land, countryStyle.shadowColor, countryStyle.elevation!);
      }

      if (countryStyle.hasFill) {
        drawFill(land, countryStyle.color!);
      }
    }

    if (outline && countryStyle.hasOutline) {
      final borders = createPathForShapes(topo!.borders);
      drawStroke(borders, countryStyle.borderColor!, countryStyle.borderWidth);
    }

    if (outline && coastlineStyle.shouldPaint) {
      final land = createPathForShapes(topo!.coastline, clip: false);
      drawStroke(land, coastlineStyle.color!, coastlineStyle.width);
    }
  }

  void drawCountries() {
    final List<Pair<Country, CountryStyle>> countries = [];
    theme.countryTheme.overrides.forEach(
      (country, style) => countries.add(Pair(country, style)),
    );

    countries.sort((a, b) => a.second.elevation!.compareTo(b.second.elevation!));

    for (final country in countries) {
      drawCountry(country.first, country.second);
    }
  }

  void drawCountry(Country country, CountryStyle style) {
    if (!(outline && style.hasOutline) || !(fill && style.hasFill && style.hasOutline)) {
      return;
    }

    Path? path;
    if (fill) {
      path = createPathForCountry(country);
      drawElevation(path, style.shadowColor, style.elevation!);
      drawFill(path, style.color!);
    }

    if (outline) {
      path ??= createPathForCountry(country, clip: false);
      drawStroke(
        path,
        style.hasOutline ? style.borderColor! : style.color!,
        style.hasOutline ? style.borderWidth : 0.25,
      );
    }
  }

  void drawRivers() {
    if (outline && !topo!.hasRivers) return;

    topo!.rivers.forEach((river, shapes) {
      final style = theme.riverTheme.style(river);

      if (style.shouldPaint) {
        final minZoom = river.zoom - 2.0;
        final color = fadeIn(style.color!, minZoom)!;

        if (color.opacity > 0) {
          final path = createPathForShapes(shapes, clip: false);
          drawStroke(path, color, style.width);
        }
      }
    });
  }

  void drawLakes() {
    if (fill && !topo!.hasLakes) return;

    topo!.lakes.forEach((lake, shapes) {
      final minZoom = lake.zoom - 2.0;
      final color = fadeIn(theme.lakeTheme.color(lake)!, minZoom)!;

      if (color.opacity > 0) {
        for (final arc in shapes) {
          final path = createPathForCoordinates(arc, clip: false);
          drawFill(path, color);
        }
      }
    });
  }

  Color? fadeIn(Color color, double zoom) {
    return Color.lerp(
      color.withAlpha(0),
      color,
      interval(zoom - 0.5, zoom, this.zoom!),
    );
  }

  Path createPathForCountry(Country country, {bool clip = true}) {
    final shapes = topo!.countries[country] ?? [];
    return createPathForShapes(shapes, clip: clip);
  }
}
