import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pinkfox/Feature/screen3/presentation/views/screen3_view.dart';
import 'package:pinkfox/core/utils/components.dart';

class ImageViewer extends StatefulWidget {
  final File imageFile;

  const ImageViewer({super.key, required this.imageFile});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;
  Offset _previousOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: IconButton(
                onPressed: () {
                  navigatorPush(context, const Screen3View());
                },
                icon: const Icon(
                  Icons.check,
                  size: 30,
                )),
          )
        ],
      ),
      body: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
          _previousOffset = details.focalPoint - _offset;
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _scale = _previousScale * details.scale;
            _offset = details.focalPoint - _previousOffset * details.scale;
          });
        },
        onDoubleTap: () {
          setState(() {
            _scale = 1.0;
            _offset = Offset.zero;
          });
        },
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(_offset.dx, _offset.dy)
                    ..scale(_scale),
                  child: Image.file(
                    widget.imageFile,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
