import 'package:first_harry/setion_group_widget/common/common_footer.dart';
import 'package:first_harry/setion_group_widget/common/common_header.dart';
import 'package:first_harry/setion_group_widget/common/common_item.dart';

class CommonGroup {
  final CommonHeader header;

  final CommonFooter footer;

  final double headerHeight;

  final double footerHeight;

  final List<CommonItem> items;

  CommonGroup({
    this.header,
    this.headerHeight = 20.0,
    this.footer,
    this.footerHeight = 0.0,
    this.items = const <CommonItem>[],
  });
}
