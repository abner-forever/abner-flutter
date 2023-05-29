import 'package:abner/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class ArticleCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const ArticleCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      child: TextButton(
        onPressed: () {
          _onPressDetail(context, data['id']);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(px(32))),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          //设置阴影  不适用于这里的TextButton
          elevation: MaterialStateProperty.all(0),
        ),
        child: SizedBox(
          height: px(120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                data['title'],
                style:
                    const TextStyle(fontSize: 18.0, color: Color(0xff222222)),
              ),
              Text(
                data['description'],
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(color: Color(0xff333333)),
                strutStyle: const StrutStyle(leading: 0.5),
              ),
              Container(
                  decoration: const BoxDecoration(),
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        data['author'] ?? '佚名',
                        // DateTime.now().toString(),
                        style: TextStyle(
                            fontSize: px(12), color: const Color(0xff666666)),
                      ),
                      Text(
                        formatDate(
                            DateTime.fromMillisecondsSinceEpoch(
                                data['createTime']),
                            [yyyy, "年", mm, "月", dd, "日"]),
                        style: TextStyle(
                            fontSize: px(12), color: const Color(0xff666666)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _onPressDetail(ctx, val) {
    Navigator.pushNamed(ctx, '/detail', arguments: val); //2
  }
}

class ArticleModel {
  final String title;

  final String description;

  final int createTime;

  final String updateTime;

  final String userName;

  // final int id;

  const ArticleModel(
      {required this.title,
      required this.description,
      required this.createTime,
      // this.id,
      required this.userName,
      required this.updateTime});
}
