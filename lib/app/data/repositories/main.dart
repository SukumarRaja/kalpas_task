import 'dart:convert';
import '../../services/api.dart';
import '../../services/http.dart';

class MainRepository {
  static HttpHelper helper = HttpHelper();

  Future<dynamic> getConfig() async {
    var res = await helper.get(url: ApiService.config);
    return jsonDecode(res);
  }
}
