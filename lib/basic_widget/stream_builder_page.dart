import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  StreamController<String> _streamController;
  final _datas = ['实况比分', '足球', '篮球', '数据', '分析'];
  var _lists = <String>[];

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<String>();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
        actions: [
          RaisedButton(
            onPressed: () {
              final index = Random().nextInt(5);
              _streamController.add(_datas[index]);
            },
            child: Text('发送数据'),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Center(
      child: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _lists.add(snapshot.data);
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: ListTile(
                    title: Text('$index-${_lists[index]}'),
                  ),
                );
              },
              itemCount: _lists.length,
            );
          }
          return Text('未接收到数据');
        },
      ),
    );
  }
}
