import 'package:first_harry/utils/as_screen_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicPageZero extends StatefulWidget {
  @override
  _BasicPageZeroState createState() => _BasicPageZeroState();
}

class _BasicPageZeroState extends State<BasicPageZero> {
  String _groupValue = '足球';
  final List<bool> _checkValues = [true, false];
  double _sliderValue = 1.0;
  RangeValues _rangeValues = RangeValues(0, 60);
  var _switchValue = false;
  var _dropValue = '英超';
  final List<String> _dropLists = ['英超', '西甲', '德甲', '中超', '意甲'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: DropdownButton(
                elevation: 10,
                value: _dropValue,
                dropdownColor: Colors.green,
                iconEnabledColor: Colors.yellow,
                iconDisabledColor: Colors.grey,
                focusColor: Colors.pink,
                style: Theme.of(context).textTheme.headline6,
                items: List.generate(
                  _dropLists.length,
                  (index) => DropdownMenuItem(
                      child: Text(_dropLists[index]), value: _dropLists[index]),
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _dropValue = value;
                  });
                }),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).dividerColor,
        child: buildChildWidget(context),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight),
      child: Column(
        children: [
          buildSizeBox(),
          buildBasicBtnWidget(),
          buildSizeBox(),
          buildButtonBarWidget(),
          buildSizeBox(),
          buildRadioListTile(),
          buildSizeBox(),
          buildCheckBoxListTile(),
          buildSizeBox(),
          buildSliderWidget(),
          buildSizeBox(),
          buildSwtichListTile(),
          buildSizeBox(),
          buildProgressIndicator(),
          buildSizeBox(),
          buildImageWidget(),
        ],
      ),
    );
  }

  Widget buildButtonBarWidget() {
    return Container(
      color: Theme.of(context).accentColor,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          RaisedButton(onPressed: () {}, child: Text('1')),
          RaisedButton(onPressed: () {}, child: Text('22')),
          RaisedButton(onPressed: () {}, child: Text('333')),
          RaisedButton(onPressed: () {}, child: Text('4444')),
          RaisedButton(onPressed: () {}, child: Text('55555')),
        ],
      ),
    );
  }

  Widget buildImageWidget() {
    return Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(ASScreenAdapter.width(5)),
      child: Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildProgressIndicator() {
    return Container(
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          LinearProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: ASScreenAdapter.height(5)),
            height: 60,
            width: 60,
            color: Colors.grey,
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
          Container(
            padding: EdgeInsets.all(ASScreenAdapter.width(10)),
            child: CupertinoActivityIndicator(
              radius: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwtichListTile() {
    return Container(
      color: Theme.of(context).accentColor,
      child: SwitchListTile(
        title: Text('是否使用5G下载'),
        subtitle: Text('是否使用WiFi下载'),
        secondary: Icon(Icons.network_check),
        activeColor: Colors.yellow,
        activeTrackColor: Colors.pink,
        inactiveTrackColor: Colors.green,
        inactiveThumbColor: Colors.red,
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }

  Widget buildSliderWidget() {
    return Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.symmetric(vertical: ASScreenAdapter.height(5)),
      child: Column(
        children: [
          Text('Slider值: $_sliderValue'),
          Slider(
            label: '值：$_sliderValue',
            min: 1.0,
            max: 100.0,
            divisions: 4,
            activeColor: Colors.yellow,
            inactiveColor: Colors.grey,
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.yellow,
              thumbColor: Colors.grey,
              overlayColor: Colors.red,
              valueIndicatorColor: Colors.green,
              inactiveTrackColor: Colors.purple,
            ),
            child: Slider(
                min: 1,
                max: 100,
                label: '值1：$_sliderValue',
                divisions: 5,
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                }),
          ),
          RangeSlider(
            values: _rangeValues,
            labels: RangeLabels('$_rangeValues.start', '$_rangeValues.end'),
            divisions: 4,
            activeColor: Colors.green,
            inactiveColor: Colors.yellow,
            min: 0,
            max: 100,
            onChanged: (value) {
              setState(() {
                _rangeValues = value;
              });
            },
          )
        ],
      ),
    );
  }

  Widget buildCheckBoxListTile() {
    return Container(
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          Container(
            child: CheckboxListTile(
              title: Text('足球'),
              subtitle: Text('全球最火热的运动'),
              value: _checkValues[0],
              controlAffinity: ListTileControlAffinity.leading,
              secondary: Icon(Icons.sports_football),
              onChanged: (value) {
                setState(() {
                  _checkValues[0] = value;
                });
              },
            ),
          ),
          Container(
            child: CheckboxListTile(
              title: Text('篮球'),
              subtitle: Text('NBA是篮球的最高殿堂'),
              value: _checkValues[1],
              controlAffinity: ListTileControlAffinity.leading,
              secondary: Icon(Icons.sports_baseball),
              onChanged: (value) {
                setState(() {
                  _checkValues[1] = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioListTile() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ASScreenAdapter.height(5)),
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: RadioListTile(
              value: '足球',
              groupValue: _groupValue,
              title: Text('足球'),
              activeColor: Colors.yellow,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ),
          Flexible(
            child: RadioListTile(
              value: '篮球',
              groupValue: _groupValue,
              title: Text('篮球'),
              activeColor: Colors.yellow,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ),
          Flexible(
            child: RadioListTile(
              value: '排球',
              groupValue: _groupValue,
              title: Text('排球'),
              activeColor: Colors.yellow,
              controlAffinity: ListTileControlAffinity.platform,
              toggleable: true,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBasicBtnWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ASScreenAdapter.height(5)),
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
            splashColor: Colors.white,
            onPressed: () {},
            child: Text('Raised'),
            elevation: 5,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          FlatButton(
            textColor: Colors.blue,
            color: Colors.yellow,
            onPressed: () {},
            child: Text('Flat'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          OutlineButton(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            child: Text('Outline'),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /// 间隔
  Widget buildSizeBox() {
    return SizedBox(
      height: ASScreenAdapter.height(20),
      child: Container(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
