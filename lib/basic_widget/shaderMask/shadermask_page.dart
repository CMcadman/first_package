import 'package:first_harry/basic_widget/shaderMask/as_circle_progress_paint.dart';
import 'package:first_harry/first_harry.dart';
import 'package:flutter/material.dart';

class ShaderMaskPage extends StatefulWidget {
  @override
  _ShaderMaskPageState createState() => _ShaderMaskPageState();
}

class _ShaderMaskPageState extends State<ShaderMaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShaderMask'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildSweepCircle(),
      ),
    );
  }

  Widget buildSweepCircle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 200,
          width: 200,
          child: CustomPaint(
            painter: ASCircleProgressPaint(.5),
          ),
        ),
        ASSizeBox(),
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
                    colors: [Colors.blue, Colors.pink],
                    tileMode: TileMode.clamp)
                .createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Text(
            '实况足球是一款体育赛事资讯App',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ASSizeBox(),
        Container(
          color: Colors.blue[50],
          child: SizedOverflowBox(
            size: const Size(100.0, 100.0),
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 50.0,
              width: 150.0,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSweepGradient() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return SweepGradient(colors: [Colors.amber, Colors.blue])
            .createShader(bounds);
      },
      child: buildChildImgWidget(),
    );
  }

  Widget buildRadialGradient2() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(colors: [Colors.blue, Colors.pink], radius: .5)
            .createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: buildChildImgWidget(),
    );
  }

  Widget buildRadialGradient1() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          radius: .6,
          colors: <Color>[
            Colors.transparent,
            Colors.transparent,
            Colors.grey.withOpacity(.7),
            Colors.grey.withOpacity(.7)
          ],
          stops: [0, .5, .5, 1],
        ).createShader(bounds);
      },
      // blendMode: BlendMode.color,
      blendMode: BlendMode.srcATop,
      child: buildChildImgWidget(),
    );
  }

  Widget buildLinearGradient2() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(colors: [
          Colors.blue,
          Colors.amber,
          Colors.blue,
          Colors.red,
          Colors.purple,
          Colors.pink
        ], stops: [
          0,
          0.4,
          0.41,
          0.6,
          0.61,
          1
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: buildChildImgWidget(),
    );
  }

  Widget buildLinearGradient1() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
                colors: [Colors.blue, Colors.amber, Colors.pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            .createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: buildChildImgWidget(),
    );
  }

  Widget buildChildImgWidget() {
    return SafeArea(
      child: Image.asset(
        ASConstant.others + 'other_3.jpeg',
        package: ASConstant.packageName,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
