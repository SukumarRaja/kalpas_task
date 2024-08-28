import 'dart:convert';

import 'package:kalpas/app/services/api.dart';

import '../../services/http.dart';

class NewsRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> getNews({params}) async {
    var res = await helper.get(url: '${ApiService.getNews}$params');
    return jsonDecode(res);
  }
}
