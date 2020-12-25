import 'package:first_harry/first_harry.dart';
import 'package:first_harry/setion_group_widget/common/common_header.dart';
import 'package:flutter/material.dart';

class CommonHeaderWidget extends StatelessWidget {
  final CommonHeader header;

  CommonHeaderWidget({Key key, this.header}) : super(key: key);

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

  Widget _buildChildWidget(BuildContext context) {
    if (header is CommonHeader) {
      return _buildCommonHeader(context, header);
    }
    return null;
  }

  Widget _buildCommonHeader(BuildContext context, CommonHeader header) {
    return Container(
      width: double.maxFinite,
      child: Text(
        header.header,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
