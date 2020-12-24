library first_harry;

import 'package:first_harry/utils/as_screen_adapter.dart';
import 'package:flutter/material.dart';

export 'first_test/first_test.dart';

export 'caculator/caculator_page.dart';

export 'basic_widget/text_page.dart';
export 'basic_widget/basic_page_zero.dart';
export 'basic_widget/basic_page_one.dart';
export 'basic_widget/basic_page_two.dart';
export 'basic_widget/form_page.dart';

export 'layout_widget/stack_page.dart';
export 'layout_widget/wrap_page.dart';
export 'layout_widget/flow_page.dart';

export 'location_widget/container_size_page.dart';
export 'location_widget/expand_page.dart';
export 'location_widget/cylinder_chart.dart';

export 'scroll_widget/gridview_page.dart';
export 'scroll_widget/pageview_page.dart';
export 'scroll_widget/as_pageview_page/as_pageview_page.dart';
export 'scroll_widget/listview_page.dart/listview_page.dart';
export 'scroll_widget/scrollbar_page/scrollbar_page.dart';

export 'sliver_widget/sliver_appbar.dart';
export 'sliver_widget/sliver_list_grid_page.dart';
export 'sliver_widget/nested_scrollview_page/nested_scrollview_page.dart';
export 'sliver_widget/sliver_persistent_head/sliver_persistent_head.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// screen_util初始化
class CMScreenUtils {
  void init(BuildContext context) => ASScreenAdapter.init(context);
}
