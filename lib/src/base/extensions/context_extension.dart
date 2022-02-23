import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double getWidth([double percentage = 1.0]) {
    return MediaQuery.of(this).size.width * percentage;
  }

  double getHeight([double percentage = 1.0]) {
    return MediaQuery.of(this).size.height * percentage;
  }

  double getBottomSafeAre([double percentage = 1.0]) {
    return MediaQuery.of(this).padding.bottom;
  }

  double getTopSafeArea([double percentage = 1.0]) {
    return MediaQuery.of(this).padding.top;
  }
}
