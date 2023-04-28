import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:zhongguolaodongfa_app/constant/Strings.dart';
import 'package:zhongguolaodongfa_app/model/laodongfa.dart';

class LaoDongFaController extends GetxController {
  final logger = Logger();

  static LaoDongFaController get instance => Get.put(LaoDongFaController());

  Rx<List<LaoDongFa?>?> contents = Rx<List<LaoDongFa?>?>(null);

  Future<List<LaoDongFa?>?> getContents() async {
    final url = Uri.parse(ldfurl!);

    final request = await http.get(url);
    final status = request.statusCode;

    switch (status) {
      case 200:
        final body = json.decode(request.body)["laodongfa"]["content"];

        assert(body != null);

        final content =
            body.map<LaoDongFa>((data) => LaoDongFa.fromJson(data)).toList();

        contents.value = content;

        assert(contents.value!.isNotEmpty);
        break;
      case 400:
        logger.e("客户端错误，服务器无法或不会处理请求");
        break;
      case 403:
        logger.e("服务器理解请求，但拒绝授权");
        break;
      case 404:
        logger.e("请求的API不可用");
        break;
      case 500:
        logger.e("服务器遇到意外情况，无法完成请求。");
        break;
      default:
        logger.e("$status => 出了问题！可是啥问题不知道！");
        break;
    }

    return contents.value!;
  }
}
