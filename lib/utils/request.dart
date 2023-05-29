import 'package:abner/utils/toast.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';

final dio = Dio();

class NetUtils {
  /// get请求传入url+请求参数
  Future<dynamic> get(String url, Map<dynamic, dynamic> params) async {
    if (params.isNotEmpty) {
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key=$value&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    try {
      Response response;
      if (kDebugMode) {
        print(url);
      }

      response = await dio.get(url);
      if (kDebugMode) {
        print('response$response');
      }
      var res = json.decode(response.toString()); //对数据进行Json转化
      if (res['code'] == 200 || res['code'] == 0) {
        return res['data'];
      } else {
        toast(res['msg']);
      }
    } catch (e) {
      print('requset error:$e');
      print(e.toString());
    }
  }

  post(
    String url,
    Map<String, String> params,
  ) async {
    var response = await dio.post(url, data: params);
    var res = json.decode(response.toString()); //对数据进行Json转化
    if (res['code'] == 200) {
      return res;
    } else {
      toast(res['msg']);
    }
  }
}

var request = NetUtils();
