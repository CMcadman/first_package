import 'dart:html';

import 'package:first_harry/basic_widget/draggable/draggable_scrollable_sheet.dart';
import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  var _dragData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖拽组件'),
      ),
      body: Center(
        // color: Theme.of(context).primaryColor,
        child: buildDragg(),
      ),
    );
  }

  Widget buildDragg() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          RaisedButton(
            child: Text('DraggableScrollableSheet'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DraggableScrollableSheetPage();
                  },
                ),
              );
            },
          ),
          buildChildWidget(),
          SizedBox(
            height: 200,
          ),
          DragTarget<Color>(
            builder: (BuildContext context, List<Color> candidateData,
                List<dynamic> rejectedData) {
              print('candidateData:$candidateData,rejectedData:$rejectedData');
              return _dragData == null
                  ? Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                    )
                  : buildContainer(Colors.red);
            },
            onWillAccept: (Color color) {
              print('onWillAccept:$color');
              return true;
            },
            onAccept: (Color color) {
              print('onAccept:$color');
              setState(() {
                _dragData = color;
              });
            },
            onLeave: (data) {
              print('onLeave:$data');
            },
          )
        ],
      ),
    );
  }

  Widget buildChildWidget() {
    return Draggable(
      // axis: Axis.vertical,
      data: Colors.green,
      child: buildContainer(Colors.red),
      feedback: buildContainer(Colors.amber),
      // childWhenDragging: buildContainer(Colors.green),
      // onDragStarted: () {
      //   print('onDragStarted');
      // },
      // onDragEnd: (details) {
      //   print('onDragEnd: $details');
      // },
      // onDragUpdate: (details) {
      //   print('onDragUpdate: $details');
      // },
      // onDragCompleted: () {
      //   print('onDragCompleted');
      // },
      // onDraggableCanceled: (velocity, offset) {
      //   print('onDraggableCanceled velocity:$velocity,offset:$offset');
      // },
    );
  }

  Widget buildContainer(Color color) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Harry',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
