import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverFixedExtentListPage extends StatefulWidget {
  @override
  _SliverFixedExtentListPageState createState() =>
      _SliverFixedExtentListPageState();
}

class _SliverFixedExtentListPageState extends State<SliverFixedExtentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverFixedExtentList'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    var selectedRadio = 0;
                    return AlertDialog(
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(4, (index) {
                              return RadioListTile(
                                value: index,
                                groupValue: selectedRadio,
                                title: Text('$index'),
                                onChanged: (value) {
                                  setState(() => selectedRadio = value);
                                },
                              );
                            }),
                          );
                        },
                      ),
                    );
                  },
                );
              }),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildPrototypeExtentList(),
        // child: buildOpacity(),
        // child: buildLayoutBuilder(),
        // child: buildChildWidget(),
      ),
    );
  }

  Widget buildPrototypeExtentList() {
    var _widget = Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '实况比分是一款体育资讯',
        style: TextStyle(fontSize: 30, color: Colors.black87),
      ),
    );
    return CustomScrollView(
      slivers: [
        SliverPrototypeExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.primaries[index],
                child: _widget,
              );
            }, childCount: 6),
            prototypeItem: _widget),
      ],
    );
  }

  Widget buildOpacity() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverOpacity(
            opacity: 0.5,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 60,
                  color: Colors.primaries[index],
                );
              }, childCount: 5),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLayoutBuilder() {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(
          builder: (context, constraints) {
            print('${constraints.userScrollDirection}');
            var color = Colors.red;
            if (constraints.userScrollDirection == ScrollDirection.forward) {
              color = Colors.blue;
            }
            return SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: color,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildChildWidget() {
    return CustomScrollView(
      slivers: [
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('$index'),
                  tileColor: Colors.primaries[index],
                );
              },
              childCount: 5,
            ),
            itemExtent: 60),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Theme.of(context).accentColor,
            child: Icon(
              Icons.sentiment_very_satisfied,
              size: 50,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
}
