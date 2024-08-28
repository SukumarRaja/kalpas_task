import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repositories/main.dart';

int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  final mainRepository = MainRepository();

  final _configData = {}.obs;

  get configData => _configData.value;

  set configData(value) {
    _configData.value = value;
  }

  final _tabLength = 3.obs;

  get tabLength => _tabLength.value;

  set tabLength(value) {
    _tabLength.value = value;
  }

  final _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  set currentIndex(value) {
    _currentIndex.value = value;
  }

  final _onBoardingList = <dynamic>[].obs;

  get onBoardingList => _onBoardingList.value;

  set onBoardingList(value) {
    _onBoardingList.value = value;
  }

  final _onboardSelectedIndex = 0.obs;

  get onboardSelectedIndex => _onboardSelectedIndex.value;

  set onboardSelectedIndex(value) {
    _onboardSelectedIndex.value = value;
  }

  showLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var language = pref.getString('language');
    if (language != null && language.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  setLanguage({language}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('language', '$language');
  }

  getOnboardData() {
    List<dynamic> list = [
      {
        'image_url': 'assets/images/offer.png',
        'title': "on_boarding_1_title".tr,
        'description': "on_boarding_1_description".tr,
      },
      {
        'image_url': 'assets/images/offer.png',
        'title': "on_boarding_2_title".tr,
        'description': "on_boarding_2_description".tr,
      },
      {
        'image_url': 'assets/images/offer.png',
        'title': "on_boarding_3_title".tr,
        'description': "on_boarding_3_description".tr,
      },
    ];
    onBoardingList = list;
    return onBoardingList;
  }

  getConfigData() async {
    // getConfigSuccess = false;
    // try {
    //   var res = await mainRepository.getConfig();
    //   if (statusCode == 200) {
    //     getConfigSuccess = true;
    //     debugPrint("Successfully get config data");
    //     configData = res;
    //     debugPrint("Config Data is: $configData");
    //   } else if (statusCode == 404) {
    //     getConfigSuccess = false;
    //     serverDown = true;
    //     debugPrint("Server down, base url");
    //   } else {
    //     serverDown = false;
    //     configData = {};
    //     getConfigSuccess = false;
    //     debugPrint("Failed to get config data");
    //   }
    // } catch (e) {
    //   getConfigSuccess = false;
    //   debugPrint("Error on get config data $e");
    // }
  }
}
