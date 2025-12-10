import 'package:croppy/src/src.dart';
import 'package:flutter/widgets.dart';

/// Resizes a given [cropRect] to match the given [newAspectRatio].
Rect resizeCropRectWithAspectRatio(
  Rect cropRect,
  CropAspectRatio? newAspectRatio,
) {
  if (newAspectRatio == null) return cropRect;
  final newAspectRatioValue = newAspectRatio.width / newAspectRatio.height;

  final newSizeFromWidth = Size(
    cropRect.width,
    cropRect.width / newAspectRatioValue,
  );

  final newSizeFromHeight = Size(
    cropRect.height * newAspectRatioValue,
    cropRect.height,
  );

  //final newSize = newSizeFromWidth.area > newSizeFromHeight.area
  //    ? newSizeFromWidth
  //    : newSizeFromHeight;
  // アスペクト比が近い方を選ぶように修正
  final cropRectAspectRatio = cropRect.width / cropRect.height;
  final diffWidth = (cropRectAspectRatio - newAspectRatioValue).abs();
  final diffHeight = (1 / cropRectAspectRatio - newAspectRatioValue).abs();
  final newSize = diffWidth < diffHeight ? newSizeFromWidth : newSizeFromHeight;

  final newRect = Rect.fromCenter(
    center: cropRect.center,
    width: newSize.width,
    height: newSize.height,
  );

  return newRect;
}
