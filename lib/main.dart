import 'package:abner/router/index.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'page/index.dart';
import 'store/state.dart';
import 'store/reducer.dart';

void main() {
  final store =
      Store<CountState>(reducer, initialState: CountState.initState());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CountState> store;
  const MyApp(this.store, {Key? key}) : super(key: key);

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
        store: store,
        child: MaterialApp(
          title: 'title',
          navigatorObservers: [MyApp.routeObserver],

          debugShowCheckedModeBanner: false, //去掉右上角debug
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(245, 245, 245, 1),
            focusColor: Colors.red,
            // inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
          ),
          home: const HomePage(
            title: '首页',
            // store,
          ),
          routes: routes,
        ));
  }
}
