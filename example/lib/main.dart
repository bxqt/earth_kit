// ignore_for_file: prefer_const_constructors

import 'package:earth_kit/earth_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showHeatmap = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heatmaps = [
      for (var i = 0; i < 10; i++)
        Heatmap.debugGradient(
          Colors.red,
          pixelSize: 2,
          zIndex: 1.5,
          width: 1440,
          height: 720,
        ),
    ];

    return MaterialApp(
      title: 'Earth',
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: true,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () => setState(() => showHeatmap = !showHeatmap),
          child: Center(
            child: EarthKit(
              renderer: (state) => [
                HeatmapRenderer(
                  state: state,
                  heatmaps: heatmaps,
                )
                /* WindRenderer(
                  state: state,
                  color: Colors.cyanAccent,
                  uField: VectorField([
                    [25, 200, 100],
                    [25, 200, 100],
                    [25, 200, 100],
                  ]),
                  vField: VectorField([
                    [0, 0, 0],
                    [0, 0, 0],
                    [0, 0, 0],
                  ]),
                ), */
              ],
              polylines: Graticule.grid(
                horizontalCount: 10,
                verticalCount: 10,
              ),
              topographies: [
                Topography.m110,
                Topography.m50.atZoom(6),
              ],
              expand: true,
              projection: Projections.orthographic,
              duration: Duration(seconds: 3),
              theme: EarthTheme(
                waterColor: Color(0xFF0F3490),
                coastlineStyle: Stroke(
                  color: Colors.white,
                  width: 3.0,
                ),
                countryTheme: CountryTheme.none,
                graticuleTheme: GraticuleTheme(
                  style: Stroke(color: Colors.white24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double interval(double begin, double end, double t) {
  assert(t != null);

  return ((t - begin) / (end - begin)).clamp(0.0, 1.0);
}
