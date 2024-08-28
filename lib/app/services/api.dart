import '../config/config.dart';

class ApiService {
  ///config
  static const config = "${AppConfig.baseUrl}${AppConfig.versionUrl}/config";

  ///
  static const getNews = "${AppConfig.baseUrl}${AppConfig.versionUrl}";

  ///auth
  static const login =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/auth/phone-login";
}
