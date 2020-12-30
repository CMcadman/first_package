import 'package:flutter/material.dart';

class DraggableScrollableSheetPage extends StatefulWidget {
  @override
  _DraggableScrollableSheetPageState createState() =>
      _DraggableScrollableSheetPageState();
}

class _DraggableScrollableSheetPageState
    extends State<DraggableScrollableSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DraggableScrollableSheet'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Stack(
      children: [
        Column(
          children: [
            Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583224371276&di=c8a9d759bdde3218aef0f24268f11ab2&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Fent%2Fr%2F2009-03-27%2FU2507P28T3D2441286F328DT20090327082744.jpg'),
            Container(
              height: 200,
              color: Colors.yellow,
              alignment: Alignment.center,
              child: Text('电影介绍'),
            ),
          ],
        ),
        Positioned.fill(
          child: DraggableScrollableActuator(
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  color: Theme.of(context).accentColor,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('评论 $index'),
                        onTap: () {
                          DraggableScrollableActuator.reset(context);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
