import 'dart:math';

import 'package:flutter/material.dart';

class ASTabBarOther extends StatefulWidget {
  final List<Widget> tabs;
  final Color indicatorColor;
  final Decoration indicator;
  final Color selectedColor;
  final Color unselectedColor;
  final double indicatorHeight;
  final double height;
  final int initSelectedIndex;

  const ASTabBarOther({
    Key key,
    @required this.tabs,
    this.indicatorColor,
    this.indicator,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorHeight = 5.0,
    this.height = 50.0,
    this.initSelectedIndex = 0,
  })  : assert(tabs != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ASTabBarOtherState();
  }
}

class _ASTabBarOtherState extends State<ASTabBarOther>
    with TickerProviderStateMixin {
  int _currentIndex;
  int _lastIndex;
  Color _selectedColor;
  Color _unselectedColor;
  Color _indicatorColor;
  AnimationController _animationController;
  Animation<double> _animation;
  List<GlobalKey> _tabKeys;
  List<double> _taboffsets;
  List<double> _tabwidths;
  double _indicatorWidth = 0.0;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initSelectedIndex;
    _lastIndex = 0;
    _tabKeys = widget.tabs.map((e) => GlobalKey()).toList();
    _taboffsets = List.generate(widget.tabs.length, (_) => 0.0).toList();
    _tabwidths = List.generate(widget.tabs.length, (_) => 0.0).toList();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 0.0).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      List.generate(widget.tabs.length, (index) => saveChildOffset(index));
      initAnimation();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _selectedColor = widget.selectedColor;
    if (widget.selectedColor == null) {
      _selectedColor = Theme.of(context).accentColor;
    }
    _unselectedColor = widget.unselectedColor;
    if (widget.unselectedColor == null) {
      _unselectedColor = Colors.grey;
    }
    _indicatorColor = widget.indicatorColor;
    if (widget.indicatorColor == null) {
      _indicatorColor = _selectedColor;
    }
    return Container(
      color: Theme.of(context).accentColor,
      child: Stack(
        children: [
          Container(
            height: widget.height,
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: setupTabs(),
            ),
          ),
          Positioned(
            left: _animation.value,
            bottom: 0,
            child: Container(
              decoration: widget.indicator ??
                  BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(widget.indicatorHeight)),
                    color: _indicatorColor,
                  ),
              height: widget.indicatorHeight,
              width: _indicatorWidth,
            ),
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    )..addListener(() {
        setState(() {});
        if (_animationController.status == AnimationStatus.completed) {
          _lastIndex = _currentIndex;
        }
      });
    _animation = Tween(
            begin: 0.0,
            end: _taboffsets[_currentIndex] -
                (_indicatorWidth - _tabwidths[_currentIndex]) / 2)
        .animate(_animationController);

    _animationController.forward();
    setState(() {});
  }

  void goAnimation(int index) {
    if (_currentIndex == index ||
        _animationController.status != AnimationStatus.completed) {
      return;
    }
    _currentIndex = index;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
        if (_animationController.status == AnimationStatus.completed) {
          _lastIndex = _currentIndex;
        }
      });
    _animation = Tween(
            begin: _taboffsets[_lastIndex] -
                (_indicatorWidth - _tabwidths[_lastIndex]) / 2,
            end: _taboffsets[_currentIndex] -
                (_indicatorWidth - _tabwidths[_currentIndex]) / 2)
        .animate(_animationController);

    _animationController.forward();
    setState(() {});
  }

  List<Widget> setupTabs() {
    return List.generate(widget.tabs.length,
        (index) => setupSingleTab(widget.tabs[index], index));
  }

  Widget setupSingleTab(Widget child, int index) {
    var color = _currentIndex == index ? _selectedColor : _unselectedColor;
    final subWidget = InkWell(
      child: DefaultTextStyle(
        style: TextStyle(
          color: color,
        ),
        child: Container(
          alignment: Alignment.center,
          child: child,
          key: _tabKeys[index],
        ),
      ),
      onTap: () {
        goAnimation(index);
      },
    );
    return subWidget;
  }

  void saveChildOffset(int index) {
    RenderBox renderBox = _tabKeys[index].currentContext.findRenderObject();
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    print(
        '$index-offset:${offset.dx}-width:${size.width}-screenWidth:${MediaQuery.of(context).size.width}');
    _indicatorWidth = max(size.width + 20, _indicatorWidth);
    _taboffsets[index] = offset.dx;
    _tabwidths[index] = size.width;
  }
}
