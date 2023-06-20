import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../enums/base_enum.dart';

class AppHelper {
  static Size getSizeByKey(GlobalKey key) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    final size = renderBox?.size;
    return size ?? Size.zero;
  }

  static Future<Size> getImageDimension({required String url}) {
    Completer<Size> completer = Completer<Size>();
    Image.network(url).image.resolve(ImageConfiguration.empty).addListener(
      ImageStreamListener(
        (ImageInfo imageInfo, bool synchronousCall) {
          Size size = Size(
            imageInfo.image.width.toDouble(),
            imageInfo.image.height.toDouble(),
          );
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  static EnumDataSource isLocalPath(String path) {
    final uri = Uri.parse(path);
    final isFile = uri.scheme == '' || uri.scheme == 'file';
    final isNetWork = uri.scheme == 'http' || uri.scheme == 'https';
    if (isFile) return EnumDataSource.file;
    if (isNetWork) return EnumDataSource.network;
    throw ArgumentError('Invalid path: $path');
  }

  static Color getRandomColor() {
    final random = Random();
    final colorsList = Colors.primaries;
    final randomIndex = random.nextInt(colorsList.length);
    return colorsList[randomIndex];
  }
}
