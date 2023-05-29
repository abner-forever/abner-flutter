import 'package:abner/api/index.dart';
import 'package:abner/utils/request.dart';
import 'package:abner/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'article_item.dart';

class ArticleList extends StatefulWidget {
  final userId;
  const ArticleList({Key? key, this.userId}) : super(key: key);
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  // ignore: deprecated_member_use
  List articleList = <ArticleModel>[];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool hasMore = true;
  num pageNum = 1;
  bool isShowIcon = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var userId = ModalRoute.of(context)?.settings.arguments;

    if (mounted) {
      if (userId != null && userId != '') {
        _getMyArticle(userId);
      } else {
        _getArticleList(false, 1);
      }
    }

    scrollController.addListener(() {
      if (hasMore &&
          !isLoading &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent) {
        setState(() {
          if (userId != null && userId != '') {
            _getMyArticle(userId);
          } else {
            isLoading = true;
            pageNum++;
            _getArticleList(true, pageNum);
          }
        });
      }
      if (scrollController.position.pixels > px(200)) {
        setState(() {
          isShowIcon = true;
        });
      } else {
        setState(() {
          isShowIcon = false;
        });
      }
      //显示回到顶部
    });
  }

  Future _getMyArticle(userId) async {
    // var params = {"userId": userId};
    var res = await request.get(Api.acrticleList, {});
    print(res.toString());
    setState(() {
      articleList = res;
    });
    isLoading = false;
    hasMore = false;
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void backToTop() {
    scrollController.jumpTo(0.0);
  }

  Future _getArticleList(isPage, pageNum) async {
    // var params = {'pageSize': 8, 'pageNo': pageNum};
    var res = await request.get(Api.acrticleList, {});
    print(DateTime.now());
    if (isPage) {
      setState(() {
        articleList.addAll(res['list']);
      });
    } else {
      setState(() {
        articleList = res['list'];
      });
    }
    if (res['more'] == false) {
      setState(() {
        isLoading = false;
        hasMore = false;
      });
    }
  }

  Widget renderBottom() {
    if (isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else if (!hasMore) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: const Text(
          '没有数据了',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: const Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  Widget _articlelist() {
    if (articleList.isNotEmpty) {
      return RefreshIndicator(
          onRefresh: () {
            setState(() {
              pageNum = 1;
            });
            Future fn;
            var userId = ModalRoute.of(context)?.settings.arguments;
            if (userId != null && userId != '') {
              fn = _getMyArticle(userId);
            } else {
              fn = _getArticleList(false, 1);
            }
            return fn;
          },
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemCount: articleList.length + 1,
            separatorBuilder: (context, index) {
              return const Divider(height: .5, color: Color(0xFFDDDDDD));
            },
            itemBuilder: (context, index) {
              if (index < articleList.length) {
                return ArticleCard(articleList[index]);
              } else {
                return renderBottom();
              }
            },
          ));
    } else {
      return const Center(
        child: Text('加载中。。。'),
      );
    }
  }

  Widget _home() {
    return Stack(
      alignment: const Alignment(.9, .9), //分析 2
      children: [
        _articlelist(),
        isShowIcon
            // ignore: deprecated_member_use
            ? CircleAvatar(
                backgroundColor: Color(0xfff5f5f5),
                radius: 30.0,
                child: IconButton(
                    onPressed: backToTop,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(
                      CupertinoIcons.arrow_up_to_line_alt,
                      color: Color(0xff333333),
                    )))
            : const Text('')
      ],
    );
  }

  Widget build(context) {
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          title: const Text('文章列表'),
          actions: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: const Icon(Icons.menu),
            )
          ],
        ),
        body: _home());
  }
}
