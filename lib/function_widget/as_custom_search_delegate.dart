import 'dart:math';

import 'package:flutter/material.dart';

class ASCustomSearchDelegate extends SearchDelegate<String> {
  /// 返回输入搜索框后面的组件
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  /// 返回输入搜索框前的组件
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  /// 返回搜索结果组件
  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 2,
          color: Theme.of(context).accentColor,
          indent: 20,
        );
      },
      itemCount: 8,
    );
  }

  /// 返回建议的类型数据
  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Harry $index'),
          onTap: () {
            query = 'Harry $index';
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.red,
          height: 2,
          indent: 20,
        );
      },
      itemCount: Random().nextInt(3),
    );
  }
}
