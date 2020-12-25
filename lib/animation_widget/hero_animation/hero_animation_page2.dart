import 'package:first_harry/utils/as_constant.dart';
import 'package:flutter/material.dart';

class HeroAnimationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过渡动画2'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: 'hero',
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  ASConstant.adhots + 'adhots_5.jpg',
                  package: ASConstant.packageName,
                  fit: BoxFit.fitWidth,
                ),
              )),
        ),
      ),
    );
  }
}
