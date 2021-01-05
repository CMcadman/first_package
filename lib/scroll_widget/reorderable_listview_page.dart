import 'package:flutter/material.dart';

class ReorderableListViewPage extends StatefulWidget {
  @override
  _ReorderableListViewPageState createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  var items = List.generate(20, (index) => '$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动排序的列表组件'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return ReorderableListView(
      children: <Widget>[
        for (String item in items)
          Container(
            key: ValueKey(item),
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color:
                  Colors.primaries[int.parse(item) % Colors.primaries.length],
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              '$item',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
      ],
      onReorder: (oldIndex, newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        var child = items.removeAt(oldIndex);
        items.insert(newIndex, child);
        setState(() {});
      },
    );
  }
}
