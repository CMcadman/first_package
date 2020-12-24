import 'package:first_harry/scroll_widget/as_pageview_page/as_pageview_weiget.dart';
import 'package:first_harry/utils/as_constant.dart';
import 'package:flutter/material.dart';

class ASPageViewPage extends StatefulWidget {
  @override
  _ASPageViewPageState createState() => _ASPageViewPageState();
}

class _ASPageViewPageState extends State<ASPageViewPage> {
  final _imgList = [
    ASConstant.adhots + 'adhots_2.jpg',
    ASConstant.adhots + 'adhots_3.jpg',
    ASConstant.adhots + 'adhots_5.jpg',
    ASConstant.adhots + 'adhots_6.jpg',
    ASConstant.adhots + 'adhots_7.jpg',
    ASConstant.adhots + 'adhots_8.jpg',
    ASConstant.adhots + 'adhots_9.jpg',
    ASConstant.adhots + 'adhots_10.jpg',
    ASConstant.adhots + 'adhots_11.jpg',
    ASConstant.adhots + 'adhots_12.jpg',
    ASConstant.adhots + 'adhots_13.jpg',
    ASConstant.adhots + 'adhots_14.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('广告页'),
      ),
      body: Center(
        child: ASPageViewWidget(
          imgList: _imgList,
        ),
      ),
    );
  }
}
