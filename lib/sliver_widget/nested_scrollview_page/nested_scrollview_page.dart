import 'package:first_harry/scroll_widget/as_pageview_page/as_pageview_weiget.dart';
import 'package:first_harry/sliver_widget/nested_scrollview_page/sticky_tabbar_delegate.dart';
import 'package:first_harry/utils/as_constant.dart';
import 'package:first_harry/utils/as_screen_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NestedScrollViewPage extends StatefulWidget {
  @override
  _NestedScrollViewPageState createState() => _NestedScrollViewPageState();
}

class _NestedScrollViewPageState extends State<NestedScrollViewPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _adList = <String>[
    ASConstant.adhots + 'adhots_2.jpg',
    ASConstant.adhots + 'adhots_3.jpg',
    ASConstant.adhots + 'adhots_5.jpg',
    ASConstant.adhots + 'adhots_6.jpg',
  ];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
        color: Theme.of(context).primaryColor,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 240.0,
                // pinned: true,
                flexibleSpace: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: ASScreenAdapter.height(8)),
                  child: ASPageViewWidget(
                    imgList: _adList,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  child: TabBar(
                    tabs: <Widget>[
                      Tab(
                        text: '足球',
                      ),
                      Tab(
                        text: '蓝球',
                      ),
                    ],
                    labelColor: Theme.of(context).accentColor,
                    controller: _tabController,
                    indicatorColor: Colors.purple,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              buildFootball(context),
              buildBasketball(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFootball(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemBuilder: (context, index) {
          var isshow = index != 0;
          return Column(
            children: [
              Offstage(
                offstage: isshow,
                child: SizedBox(
                  height: 5,
                ),
              ),
              Container(
                height: 50,
                color: Colors.primaries[index % Colors.primaries.length],
                alignment: Alignment.center,
                child: Text(
                  '足球$index',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 5.0,
            child: Container(
              color: Theme.of(context).dividerColor,
            ),
          );
        },
        itemCount: 30,
      ),
    );
  }

  Widget buildBasketball(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                '篮球$index',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            );
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
