import 'package:flutter/material.dart';

class FirstTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '第一个package',
        ),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text(
              '测试111',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.add,
              size: 100.0,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
