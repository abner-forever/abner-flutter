import 'package:flutter/material.dart';

class TabViewModel {
  final String title;
  final Widget widget;

  const TabViewModel({
    required this.title,
    required this.widget,
  });
}

class TabView extends StatelessWidget {
  final String title;
  final bool tabScrollable;
  final List<TabViewModel> demos;
  final TabController tabController;

  TabView({
    required this.title,
    required this.tabController,
    required this.demos,
    this.tabScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          toolbarOpacity: 1,
          bottom: TabBar(
            controller: this.tabController,
            isScrollable: this.tabScrollable,
            tabs: this.demos.map((item) => Tab(text: item.title)).toList(),
            labelStyle: TextStyle(color: Colors.pink[100]),
            indicatorColor: Colors.pink,
            unselectedLabelColor: Colors.red,
            labelColor: Colors.blue,
          ),
        ),
        body: TabBarView(
          controller: this.tabController,
          children: this.demos.map((item) => item.widget).toList(),
        ));
  }
}
