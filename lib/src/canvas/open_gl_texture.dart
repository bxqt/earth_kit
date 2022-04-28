import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:earth_kit/earth_kit.dart';

class OpenGLTexture extends StatefulWidget {
  final String id;
  final EarthState? state;
  final dynamic data;
  const OpenGLTexture({
    Key? key,
    required this.id,
    this.state,
    this.data,
  }) : super(key: key);

  @override
  _OpenGLTextureState createState() => _OpenGLTextureState();
}

class _OpenGLTextureState extends State<OpenGLTexture> {
  OpenGLTextureController? controller;

  @override
  void didUpdateWidget(OpenGLTexture oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state != oldWidget.state) {
      controller?.updateState(context, widget.state);
    }

    if (widget.data != oldWidget.data) {
      controller?.updateData(widget.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: 'gl_texture',
      creationParams: widget.id,
      creationParamsCodec: const StandardMessageCodec(),
      layoutDirection: TextDirection.ltr,
      onPlatformViewCreated: (id) {
        controller = OpenGLTextureController(id)
          ..updateState(context, widget.state)
          ..updateData(widget.data);
      },
    );
  }
}

class OpenGLTextureController {
  final int id;
  final MethodChannel _channel;
  OpenGLTextureController(
    this.id,
  ) : _channel = MethodChannel('gl_texture_$id');

  Future<void> updateData(dynamic data) {
    return _channel.invokeMethod('onDataChanged', data);
  }

  Future<void> updateState(BuildContext context, EarthState? state) async {
    if (state == null) return;

    return _channel.invokeMethod(
      'onStateChanged',
      _EarthState.ofState(state, context).toMap(),
    );
  }
}

class _EarthState {
  final Size size;
  final Size parentSize;
  final LatLng? origin;
  final bool isMoving;
  _EarthState({
    required this.size,
    required this.parentSize,
    required this.origin,
    required this.isMoving,
  });

  factory _EarthState.ofState(EarthState state, BuildContext context) {
    final snapshot = state.snapshot;
    final size = snapshot.size;

    final pr = MediaQuery.of(context).devicePixelRatio;

    return _EarthState(
      size: size * pr,
      parentSize: snapshot.parentSize * pr,
      origin: snapshot.origin,
      isMoving: snapshot.isMoving,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'size': {
        'width': size.width,
        'height': size.height,
      },
      'parentSize': {
        'width': parentSize.width,
        'height': parentSize.height,
      },
      'origin': {
        'latitude': origin!.latitudeRad,
        'longitude': origin!.longitudeRad,
      },
      'isMoving': isMoving,
    };
  }
}
