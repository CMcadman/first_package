import 'package:first_harry/caculator/caculator_item.dart';
import 'package:flutter/material.dart';

class CaculatorKeyboard extends StatelessWidget {
  final ValueChanged<String> onValueChange;

  const CaculatorKeyboard({Key key, this.onValueChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var listData = setListData();
    return Wrap(
      runSpacing: 18,
      spacing: 18,
      children: List.generate(
        listData.length,
        (index) {
          return CaculatorItem(
            text: listData[index]['text'],
            textColor: listData[index]['textColor'],
            color: listData[index]['color'],
            highlightColor: listData[index]['highlightColor'],
            width: listData[index]['width'],
            onValueChange: onValueChange,
          );
        },
      ),
    );
  }

  List<Map> setListData() {
    final _keyboardList = <Map>[
      {
        'text': 'AC',
        'textColor': Colors.black,
        'color': Color(0xFFA5A5A5),
        'highlightColor': Color(0xFFD8D8D8)
      },
      {
        'text': '+/-',
        'textColor': Colors.black,
        'color': Color(0xFFA5A5A5),
        'highlightColor': Color(0xFFD8D8D8)
      },
      {
        'text': '%',
        'textColor': Colors.black,
        'color': Color(0xFFA5A5A5),
        'highlightColor': Color(0xFFD8D8D8)
      },
      {
        'text': '÷',
        'color': Color(0xFFE89E28),
        'highlightColor': Color(0xFFEDC68F)
      },
      {'text': '7', 'color': Color(0xFF363636)},
      {'text': '8', 'color': Color(0xFF363636)},
      {'text': '9', 'color': Color(0xFF363636)},
      {
        'text': 'x',
        'color': Color(0xFFE89E28),
        'highlightColor': Color(0xFFEDC68F)
      },
      {'text': '4', 'color': Color(0xFF363636)},
      {'text': '5', 'color': Color(0xFF363636)},
      {'text': '6', 'color': Color(0xFF363636)},
      {
        'text': '-',
        'color': Color(0xFFE89E28),
        'highlightColor': Color(0xFFEDC68F)
      },
      {'text': '1', 'color': Color(0xFF363636)},
      {'text': '2', 'color': Color(0xFF363636)},
      {'text': '3', 'color': Color(0xFF363636)},
      {
        'text': '+',
        'color': Color(0xFFE89E28),
        'highlightColor': Color(0xFFEDC68F)
      },
      {'text': '0', 'color': Color(0xFF363636), 'width': 158.0},
      {'text': '.', 'color': Color(0xFF363636)},
      {
        'text': '=',
        'color': Color(0xFFE89E28),
        'highlightColor': Color(0xFFEDC68F)
      },
    ];
    return _keyboardList;
  }
}
