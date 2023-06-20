import 'package:flutter/material.dart';

class ControllerHelper {
  static void jumpToTop(ScrollController controller) {
    controller.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 350),
    );
  }

  static void jumpToBottom(ScrollController controller) {
    controller.animateTo(
      controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 350),
    );
  }

  static void jumpToPosition(ScrollController controller, double position) {
    final clampedPosition = position.clamp(
      0,
      controller.position.maxScrollExtent,
    );
    controller.animateTo(
      clampedPosition.toDouble(),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }
}
