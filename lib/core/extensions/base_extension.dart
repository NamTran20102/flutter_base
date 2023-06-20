import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

extension KeyboardHidingExtension on Widget {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension StringExtension on String {
  String get toFirstCapital {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get removeDiacritics {
    return replaceAll(RegExp(r'[^\x00-\x7F]'), '').toLowerCase();
  }
}

extension ListExtension<T> on List {
  bool hasObjectInList(T object, bool Function(T, T) condition) {
    return any((item) => condition(item, object));
  }

  void toggleAll<T>(List<T> list) {
    if (length == list.length) {
      clear();
    } else {
      clear();
      addAll(list);
    }
  }
}

extension SetExtension on Set<dynamic> {
  void toggle(String val) {
    if (!contains(val)) {
      add(val);
    } else {
      remove(val);
    }
  }

  void toggleAll(List<String> list) {
    if (length == list.length) {
      clear();
    } else {
      addAll(list);
    }
  }
}

extension IntegetExtension on int? {
  bool get success {
    if (this == 200 || this == 201 || this == 204) {
      return true;
    }
    return false;
  }
}

extension FileExtention on File {
  int get size {
    final sizeInBytes = lengthSync();
    return sizeInBytes;
  }

  String get name {
    return path.basename(this.path);
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapWithIndex<T>(T Function(int i, E e) f) {
    var i = 0;
    return map((e) => f(i++, e));
  }
}

extension MediaQueryExtension on BuildContext {
  double get heightDevice => mediaQuery.size.height;

  double get widthDevice => mediaQuery.size.width;

  double dynamicWidth({required double val}) => widthDevice * val;

  double dynamicHeight({required double val}) => heightDevice * val;
}

extension DurationExtension on BuildContext {
  Duration get durationLow1x => const Duration(milliseconds: 100);

  Duration get durationLow2x => const Duration(milliseconds: 250);

  Duration get durationLow3x => const Duration(milliseconds: 500);

  Duration get durationLow4x => const Duration(milliseconds: 750);

  Duration get durationNormal1x => const Duration(milliseconds: 1000);

  Duration get durationNormal2x => const Duration(milliseconds: 1250);

  Duration get durationNormal3x => const Duration(milliseconds: 1500);

  Duration get durationNormal4x => const Duration(milliseconds: 1750);

  Duration get durationSlow1x => const Duration(milliseconds: 2000);

  Duration get durationSlow2x => const Duration(milliseconds: 2250);

  Duration get durationSlow3x => const Duration(milliseconds: 2500);

  Duration get durationSlow4x => const Duration(milliseconds: 2750);

  Duration get durationVerySlow1x => const Duration(milliseconds: 3000);

  Duration get durationVerySlow2x => const Duration(milliseconds: 3250);

  Duration get durationVerySlow3x => const Duration(milliseconds: 3500);

  Duration get durationVerySlow4x => const Duration(milliseconds: 3750);

  Duration get durationTooSlow1x => const Duration(milliseconds: 4000);

  Duration get durationTooSlow2x => const Duration(milliseconds: 4250);

  Duration get durationTooSlow3x => const Duration(milliseconds: 4500);

  Duration get durationTooSlow4x => const Duration(milliseconds: 4750);
}
