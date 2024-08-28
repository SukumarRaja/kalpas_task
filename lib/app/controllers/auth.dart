import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/pages/auth/login.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  ///repository
  // final repository = AuthRepository();

  ///login text controllers
  final lPhone = TextEditingController();
  final lPassword = TextEditingController();

  ///form keys
  final loginFormKey = GlobalKey<FormState>();

  ///repository
  // final repository = AuthRepository();

  ///variables

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  final _isPhoneEmpty = false.obs;

  get isPhoneEmpty => _isPhoneEmpty.value;

  set isPhoneEmpty(value) {
    _isPhoneEmpty.value = value;
  }

  final _isPhoneLengthLessThanTen = false.obs;

  get isPhoneLengthLessThanTen => _isPhoneLengthLessThanTen.value;

  set isPhoneLengthLessThanTen(value) {
    _isPhoneLengthLessThanTen.value = value;
  }

  final _onboardingSelectedIndex = 0.obs;

  get onboardingSelectedIndex => _onboardingSelectedIndex.value;

  set onboardingSelectedIndex(value) {
    _onboardingSelectedIndex.value = value;
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    debugPrint("token is:  $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('on_boarding');
    if (token == null) {
      return true;
    } else {
      return false;
    }
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    Get.off(() => const Login());
  }

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    if (token != null && token.isNotEmpty) {
      await preferences.remove('token');
      Get.offNamed('/login');
    }
  }
}
