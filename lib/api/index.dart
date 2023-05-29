import 'package:abner/config/index.dart';

class Api {
  // 所有文章列表
  static const String acrticleList = "$host/api/article/articleList";

  // 文章详情
  static const String acrticleDetail = "$host/api/article/getArticle";

  //我的文章列表 userId=139
  static const String myArticleList = "$host/api/article/myarticleList";

  //登录
  static const String login = "$host/api/users/login";

  //获取用户信息userId=139
  static const String getUserInfo = "$host/api/users/userinfo";

  //轮播图
  static const String banner = "$host/wyu/banner";
}
