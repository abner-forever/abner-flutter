import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'article_list/index.dart';
// import 'mine.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  // final Store<int> store;
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: '文章'),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '我的')
  ];
  final List tabBodies = [
    Home(),
    ArticleList(userId: '2323'),
    // Mine(),
  ];
  int currentIndex = 0;
  var currentPage;

  //初始化
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(this.widget.store.toString());
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 0.9),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.pink[100],
        // selectedIconTheme:,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
