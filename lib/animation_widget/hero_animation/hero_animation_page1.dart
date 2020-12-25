import 'package:first_harry/animation_widget/hero_animation/hero_animation_page2.dart';
import 'package:first_harry/utils/as_constant.dart';
import 'package:flutter/material.dart';

class HeroAnimationPage1 extends StatefulWidget {
  @override
  _HeroAnimationPage1State createState() => _HeroAnimationPage1State();
}

class _HeroAnimationPage1State extends State<HeroAnimationPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过渡动画Hero1'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: List.generate(10, (index) {
            if (index == 3) {
              return InkWell(
                child: Hero(
                  tag: 'hero',
                  child: Container(
                    child: Image.asset(
                      ASConstant.adhots + 'adhots_5.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HeroAnimationPage2();
                    },
                  ));
                },
              );
            }
            return Container(
              color: Colors.primaries[index],
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            );
          }),
        ),
      ),
    );
  }
}
