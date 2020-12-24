import 'package:first_harry/utils/as_screen_adapter.dart';
import 'package:flutter/material.dart';

class ASSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ASScreenAdapter.height(20),
      child: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
