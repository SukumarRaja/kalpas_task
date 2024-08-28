import 'dart:convert';
import '../../services/api.dart';
import '../../services/http.dart';

class AuthRepository {
  static HttpHelper helper = HttpHelper();

  Future<dynamic> login({body}) async {
    var res = await helper.post(url: ApiService.login, body: body);
    return jsonDecode(res);
  }
}
