import 'package:first_harry/basic_widget/datatable_page/datatable_model.dart';
import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  var _sortColumnIndex = 0;
  var _sortAscending = true;
  final List<DataTableModel> lists = [
    DataTableModel('harry', 18, '男'),
    DataTableModel('cocoa', 16, '女'),
    DataTableModel('jason', 27, '男', selected: true),
    DataTableModel('mandy', 21, '女'),
    DataTableModel('sonny', 25, '男'),
    DataTableModel('davis', 18, '女'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表格'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      color: Theme.of(context).accentColor,
      child: DataTable(
        headingTextStyle: Theme.of(context).textTheme.headline6,
        headingRowColor: MaterialStateProperty.all(Colors.amber),
        dataTextStyle: Theme.of(context).textTheme.subtitle1,
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: [
          DataColumn(
            label: Text('姓名'),
            tooltip: '长按提示',
            onSort: (columnIndex, ascending) {
              if (_sortColumnIndex != columnIndex) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = !_sortAscending;
                  if (_sortAscending) {
                    lists.sort((a, b) {
                      return a.name.compareTo(b.name);
                    });
                  } else {
                    lists.sort((a, b) {
                      return b.name.compareTo(a.name);
                    });
                  }
                });
              }
            },
          ),
          DataColumn(
            label: Text('年龄'),
            onSort: (columnIndex, ascending) {
              if (_sortColumnIndex != columnIndex) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = !_sortAscending;
                  if (_sortAscending) {
                    lists.sort((a, b) {
                      return a.age.compareTo(b.age);
                    });
                  } else {
                    lists.sort((a, b) {
                      return b.age.compareTo(a.age);
                    });
                  }
                });
              }
            },
          ),
          DataColumn(
            label: Text('性别'),
            onSort: (columnIndex, ascending) {
              if (_sortColumnIndex != columnIndex) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = !_sortAscending;
                  if (_sortAscending) {
                    lists.sort((a, b) {
                      return a.sex.compareTo(b.sex);
                    });
                  } else {
                    lists.sort((a, b) {
                      return b.sex.compareTo(a.sex);
                    });
                  }
                });
              }
            },
          ),
        ],
        rows: List.generate(lists.length, (index) {
          return DataRow(
            selected: lists[index].selected,
            onSelectChanged: (value) {
              setState(() {
                lists[index].selected = value;
              });
            },
            cells: [
              DataCell(Text('${lists[index].name}')),
              DataCell(Text('${lists[index].age}')),
              DataCell(Text('${lists[index].sex}')),
            ],
          );
        }).toList(),
      ),
    );
  }
}
