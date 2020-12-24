import 'package:first_harry/utils/screen_adapter.dart';
import 'package:flutter/material.dart';

class ASSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenAdapter.height(20),
      child: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
