library first_harry;

import 'package:first_harry/utils/screen_adapter.dart';
import 'package:flutter/material.dart';

export 'first_test/first_test.dart';
export 'caculator/caculator_page.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// screen_util初始化
class CMScreenUtils {
  void init(BuildContext context) => ScreenAdapter.init(context);
}
