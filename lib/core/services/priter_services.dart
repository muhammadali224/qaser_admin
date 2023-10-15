// ignore_for_file: library_prefixes

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

Future<Uint8List?> createImageFromWidget(Widget widget,
    {Duration? wait, Size? logicalSize, Size? imageSize}) async {
  var cxt = Get.context!;
// Create a repaint boundary to capture the image
  final repaintBoundary = RenderRepaintBoundary();

// Calculate logicalSize and imageSize if not provided
  logicalSize ??= View.of(cxt).physicalSize / View.of(cxt).devicePixelRatio;
  imageSize ??= View.of(cxt).physicalSize;

// Ensure logicalSize and imageSize have the same aspect ratio
  assert(logicalSize.aspectRatio == imageSize.aspectRatio,
      'logicalSize and imageSize must not be the same');

// Create the render tree for capturing the widget as an image
  final renderView = RenderView(
    view: View.of(cxt),
    child: RenderPositionedBox(
        alignment: Alignment.center, child: repaintBoundary),
    configuration: ViewConfiguration(
      size: logicalSize,
      devicePixelRatio: 1,
    ),
  );

  final pipelineOwner = PipelineOwner();
  final buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

// Attach the widget's render object to the render tree
  final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: widget,
      )).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

// Delay if specified
  if (wait != null) {
    await Future.delayed(wait);
  }

// Build and finalize the render tree
  buildOwner
    ..buildScope(rootElement)
    ..finalizeTree();

// Flush layout, compositing, and painting operations
  pipelineOwner
    ..flushLayout()
    ..flushCompositingBits()
    ..flushPaint();

// Capture the image and convert it to byte data
  final image = await repaintBoundary.toImage(
      pixelRatio: imageSize.width / logicalSize.width);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

// Return the image data as Uint8List
  return byteData?.buffer.asUint8List();
}
