import 'package:abner/page/article_list/index.dart';
// import 'package:abner/page/detail.dart';
// import 'package:abner/page/login.dart';
// import 'package:abner/page/sliver_demo/index.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder>{
  '/articlelist': (context, {arguments}) => ArticleList(userId: arguments),
  // '/detail': (context) => DetailPage(),
  // '/login': (context) => Login(),
  // 'sliver': (contex, {arguments}) => SliverDemo(title: arguments)
};
