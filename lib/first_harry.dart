library first_harry;

import 'package:first_harry/utils/as_screen_adapter.dart';
import 'package:flutter/material.dart';

export 'first_test/first_test.dart';

export 'utils/as_constant.dart';
export 'utils/as_sizebox.dart';
export 'utils/as_screen_adapter.dart';
export 'utils/as_utils.dart';
export 'utils/bar_button.dart';

export 'setion_group_widget/common/common_footer.dart';
export 'setion_group_widget/common/common_group.dart';
export 'setion_group_widget/common/common_header.dart';
export 'setion_group_widget/common/common_item.dart';
export 'setion_group_widget/widgets/common_group_widget.dart';

export 'basic_widget/text_page.dart';
export 'basic_widget/basic_page_zero.dart';
export 'basic_widget/basic_page_one.dart';
export 'basic_widget/basic_page_two.dart';
export 'basic_widget/form_page.dart';
export 'basic_widget/datatable_page/datatable_page.dart';
export 'basic_widget/draggable/draggable_page.dart';

export 'layout_widget/stack_page.dart';
export 'layout_widget/wrap_page.dart';
export 'layout_widget/flow_page.dart';

export 'location_widget/container_size_page.dart';
export 'location_widget/expand_page.dart';
export 'location_widget/cylinder_chart.dart';

export 'gesture_widget/gesture_page.dart';

export 'scroll_widget/gridview_page.dart';
export 'scroll_widget/pageview_page.dart';
export 'scroll_widget/as_pageview_page/as_pageview_page.dart';
export 'scroll_widget/listview_page.dart/listview_page.dart';
export 'scroll_widget/scrollbar_page/scrollbar_page.dart';

export 'sliver_widget/sliver_appbar.dart';
export 'sliver_widget/sliver_list_grid_page.dart';
export 'sliver_widget/nested_scrollview_page/nested_scrollview_page.dart';
export 'sliver_widget/sliver_persistent_head/sliver_persistent_head.dart';

export 'function_widget/caculator/caculator_page.dart';
export 'function_widget/date_picker_page.dart';
export 'function_widget/easyrefresh_page.dart';
export 'function_widget/pop_menu_page.dart';
export 'function_widget/time_picker_page.dart';

export 'animation_widget/curved_animation_page.dart';
export 'animation_widget/interval_animation_page.dart';
export 'animation_widget/list_animation_page.dart';
export 'animation_widget/record_animation_page.dart';
export 'animation_widget/basic_animation/basic_animation_page.dart';
export 'animation_widget/hero_animation/hero_animation_page1.dart';
export 'animation_widget/material_motion/material_motion_page.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// screen_util初始化
class CMScreenUtils {
  void init(BuildContext context) => ASScreenAdapter.init(context);
}
