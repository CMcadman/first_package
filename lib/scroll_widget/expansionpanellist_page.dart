import 'package:flutter/material.dart';

class ExpansionPanelListPage extends StatefulWidget {
  @override
  _ExpansionPanelListPageState createState() => _ExpansionPanelListPageState();
}

class _ExpansionPanelListPageState extends State<ExpansionPanelListPage> {
  final dataList = List.generate(20, (index) => false).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('展开/收缩'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            dataList[panelIndex] = !isExpanded;
          });
        },
        children: dataList.map((e) {
          return ExpansionPanel(
            isExpanded: e,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                leading: Icon(Icons.more),
                title: Text('赛事名称'),
                trailing: Icon(Icons.arrow_right_alt),
              );
            },
            body: Container(
              height: 100,
              color: Theme.of(context).accentColor,
              child: Text('展开的部分数据'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
