import 'package:abner/components/tab_view.dart';
import 'package:abner/components/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'article.dart';
// import 'swiper_demo.dart';

final List<TabViewModel> demos = [
  // TabViewModel(
  //     title: '我的博客',
  //     widget: FlutterWebView(
  //       hideHead: true,
  //       url: 'http://foreverheart.top',
  //     )),
  // TabViewModel(
  //     title: '文档',
  //     widget: FlutterWebView(hideHead: true, url: 'https://baidu.com')),
  // TabViewModel(title: '轮播图', widget: SwiperDemo()),
  // TabViewModel(title: 'CountDemo', widget: ArticlePage()),
];

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: demos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return TabView(
    //   demos: demos,
    //   tabController: tabController,
    //   title: '',
    // );
    return const Center(
      child: Text('首页'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  createState() => HomeState();
}
