import 'package:first_harry/utils/as_screen_adapter.dart';
import 'package:first_harry/utils/as_sizebox.dart';
import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式组件Wrap'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return Column(
      children: [
        ASSizeBox(),
        buildWrapWidget(),
        ASSizeBox(),
      ],
    );
  }

  Widget buildWrapWidget() {
    return Container(
      padding: EdgeInsets.all(ASScreenAdapter.width(10)),
      color: Theme.of(context).accentColor,
      child: Wrap(
        textDirection: TextDirection.rtl,
        verticalDirection: VerticalDirection.up,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        runSpacing: 5,
        // runAlignment: WrapAlignment.start,
        children: List.generate(15, (index) {
          var w = 50.0 + 8 * index;
          var h = 50.0 + 4 * index;
          var i = index % Colors.primaries.length;
          return Container(
            color: Colors.primaries[i],
            height: h,
            width: w,
            alignment: Alignment.center,
            child: Text('$index'),
          );
        }),
      ),
    );
  }
}
