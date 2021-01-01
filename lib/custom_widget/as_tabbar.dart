import 'package:flutter/material.dart';

class ASTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final Color indicatorColor;
  final Decoration indicator;
  final Color selectedColor;
  final Color unselectedColor;
  final double indicatorHeight;
  final double height;
  final int initSelectedIndex;

  const ASTabBar({
    Key key,
    @required this.tabs,
    this.indicatorColor,
    this.indicator,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorHeight = 5.0,
    this.height = 60.0,
    this.initSelectedIndex = 0,
  })  : assert(tabs != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ASTabBarState();
  }
}

class _ASTabBarState extends State<ASTabBar> with TickerProviderStateMixin {
  int _currentIndex;
  int _lastIndex;
  Color _selectedColor;
  Color _unselectedColor;
  Color _indicatorColor;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initSelectedIndex;
    _lastIndex = _currentIndex;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
        if (_animationController.status == AnimationStatus.completed) {
          _lastIndex = _currentIndex;
        } else {
          return;
        }
      });
    _animation = Tween(
            begin: 0.0,
            end: MediaQuery.of(context).size.width /
                widget.tabs.length *
                _lastIndex)
        .animate(_animationController);
    _animationController.forward();
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(widget.indicatorHeight)),
                color: _indicatorColor,
              ),
              height: widget.indicatorHeight,
              width: MediaQuery.of(context).size.width / widget.tabs.length,
            ),
          ),
        ],
      ),
    );
  }

  void goAnimation(int index) {
    if (_currentIndex == index) {
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
        } else {
          return;
        }
      });
    _animation = Tween(
            begin: MediaQuery.of(context).size.width /
                widget.tabs.length *
                _lastIndex,
            end: MediaQuery.of(context).size.width /
                widget.tabs.length *
                _currentIndex)
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
    return InkWell(
      child: DefaultTextStyle(
        style: TextStyle(
          color: color,
        ),
        child: Center(
          heightFactor: 1.0,
          child: child,
        ),
      ),
      onTap: () {
        goAnimation(index);
      },
    );
  }
}
