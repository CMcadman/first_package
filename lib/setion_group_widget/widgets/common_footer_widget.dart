import 'package:first_harry/first_harry.dart';
import 'package:first_harry/setion_group_widget/common/common_footer.dart';
import 'package:flutter/material.dart';

class CommonFooterWidget extends StatelessWidget {
  const CommonFooterWidget({Key key, this.footer}) : super(key: key);
  final CommonFooter footer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        ASConstant.pEdgeInset,
        ASScreenAdapter.height(5),
        ASConstant.pEdgeInset,
        ASScreenAdapter.height(5),
      ),
      child: _buildChildWidget(context),
      color: Theme.of(context).dividerColor,
    );
  }

  /// 生成child小部件
  Widget _buildChildWidget(BuildContext context) {
    if (footer is CommonFooter) {
      return _buildCommonFooter(context, footer);
    }
    return null;
  }

  /// 生成 common header
  Widget _buildCommonFooter(BuildContext context, CommonFooter footer) {
    return Container(
      width: double.maxFinite,
      child: Text(footer.footer, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
