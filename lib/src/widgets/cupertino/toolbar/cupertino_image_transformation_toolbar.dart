import 'dart:math';

import 'package:croppy/src/src.dart';
import 'package:flutter/cupertino.dart';

class CupertinoImageTransformationToolbar extends StatelessWidget {
  const CupertinoImageTransformationToolbar({
    super.key,
    required this.controller,
  });

  final CroppableImageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: controller.rotationZNotifier,
          builder: (context, rotationZ, _) => CupertinoKnob(
            value: rotationZ * 180 / pi,
            extent: 45,
            onChanged: (v) {
              controller.onStraighten(angleRad: v);
            },
            inactiveChild: const CupertinoStraightenIcon(
              color: CupertinoColors.white,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        ValueListenableBuilder(
          valueListenable: controller.rotationZNotifier,
          builder: (context, rotationZ, _) => CupertinoRotationSlider(
            value: rotationZ,
            extent: pi / 4,
            onStart: controller.onStraightenStart,
            onEnd: controller.onStraightenEnd,
            onChanged: (v) {
              controller.onStraighten(angleRad: v);
            },
          ),
        ),
      ],
    );
  }
}