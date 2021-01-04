import 'package:first_harry/basic_widget/datatable_page/as_datatable_source.dart';
import 'package:first_harry/basic_widget/datatable_page/datatable_model.dart';
import 'package:flutter/material.dart';

class PaginatedDataTablePage extends StatefulWidget {
  @override
  _PaginatedDataTablePageState createState() => _PaginatedDataTablePageState();
}

class _PaginatedDataTablePageState extends State<PaginatedDataTablePage> {
  List<DataTableModel> _data = [];
  var _rowsPerPage = 5;
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
    List.generate(100, (index) {
      return _data.add(
        DataTableModel('Harry$index', index + 20, index % 2 == 0 ? '男' : '女'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分页表格'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: buildChildWidget(),
        ),
      ),
    );
  }

  Widget buildChildWidget() {
    return PaginatedDataTable(
      header: Text('成绩单'),
      actions: [
        IconButton(icon: Icon(Icons.add), onPressed: () {}),
        IconButton(icon: Icon(Icons.delete), onPressed: () {})
      ],
      columns: [
        DataColumn(label: Text('姓名')),
        DataColumn(
          label: Text('年龄'),
          onSort: (columnIndex, ascending) {
            setState(() {
              _sortAscending = ascending;
              if (ascending) {
                _data.sort((a, b) => a.age.compareTo(b.age));
              } else {
                _data.sort((a, b) => b.age.compareTo(a.age));
              }
            });
          },
        ),
        DataColumn(label: Text('性别')),
      ],
      source: ASDataTableSource(_data),
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: [5, 10, 20, 25, 30],
      onRowsPerPageChanged: (value) {
        setState(() {
          _rowsPerPage = value;
        });
      },
      onPageChanged: (value) {
        print('onPageChanged:$value');
      },
      sortColumnIndex: 1,
      sortAscending: _sortAscending,
      onSelectAll: (value) {
        setState(() {
          _data.forEach((element) {
            element.selected = value;
          });
        });
      },
    );
  }
}
