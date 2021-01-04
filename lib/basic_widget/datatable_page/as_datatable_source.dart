import 'package:first_harry/basic_widget/datatable_page/datatable_model.dart';
import 'package:flutter/material.dart';

class ASDataTableSource extends DataTableSource {
  final List<DataTableModel> data;
  ASDataTableSource(this.data);

  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      cells: [
        DataCell(Text('${data[index].name}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Text('${data[index].sex}')),
      ],
      index: index,
      selected: data[index].selected,
      onSelectChanged: (value) {
        data[index].selected = value;
        notifyListeners();
      },
    );
  }

  @override
  int get selectedRowCount => 0;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;
}
