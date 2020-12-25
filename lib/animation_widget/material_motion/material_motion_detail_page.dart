import 'package:first_harry/utils/as_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialMotionDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialMotionDetail'),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Image.asset(
          ASConstant.others + 'other_1.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
