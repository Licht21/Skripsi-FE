import 'package:flutter/material.dart';

class PredictionNotifier {
  static ValueNotifier<bool> isClassified = ValueNotifier<bool>(false);

  static ValueNotifier<bool> isUploaded = ValueNotifier<bool>(false);

  static ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
}
