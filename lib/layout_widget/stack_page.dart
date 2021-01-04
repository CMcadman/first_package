import 'package:first_harry/utils/as_sizebox.dart';
import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('叠加组件Stack'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildChild1(),
          ASSizeBox(),
          buildChild2(),
          ASSizeBox(),
          buildChildPositonedDirectional(),
        ],
      ),
    );
  }

  Widget buildChildPositonedDirectional() {
    return Container(
      color: Theme.of(context).accentColor,
      height: 300,
      width: 300,
      child: Stack(
        children: [
          PositionedDirectional(
            start: 10,
            end: 10,
            top: 10,
            bottom: 10,
            child: Container(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChild2() {
    return Column(
      children: [
        ASSizeBox(),
        buildIndexStack(),
        ASSizeBox(),
        buildRowIcon(),
      ],
    );
  }

  Widget buildRowIcon() {
    return Container(
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.fastfood),
            onPressed: () {
              setState(() {
                _index = 0;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.fast_forward),
            onPressed: () {
              setState(() {
                _index = 1;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.fast_rewind),
            onPressed: () {
              setState(() {
                _index = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildIndexStack() {
    return IndexedStack(
      index: _index,
      children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood,
              size: 60,
              color: Colors.green,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.purple,
            alignment: Alignment.center,
            child: Icon(
              Icons.fast_forward,
              size: 60,
              color: Colors.green,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.pink,
            alignment: Alignment.center,
            child: Icon(
              Icons.fast_rewind,
              size: 60,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildChild1() {
    return Stack(
      alignment: Alignment.center,
      // overflow: Overflow.visible,
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
        Container(
          height: 150,
          width: 150,
          color: Colors.yellow,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.purple,
        ),
        Positioned(
          left: 60,
          width: 60,
          top: 60,
          height: 60,
          child: Container(
            color: Colors.green,
          ),
        ),
        Positioned(
          left: 100,
          top: 100,
          height: 120,
          width: 120,
          child: Container(
            color: Colors.lightGreenAccent,
          ),
        ),
      ],
    );
  }
}
