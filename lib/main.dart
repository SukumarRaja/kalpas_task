import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/controllers/locallization.dart';
import 'app/controllers/main.dart';
import 'app/controllers/theme.dart';
import 'app/lanuages/language.dart';
import 'app/lanuages/translation.dart';
import 'app/routes/routes.dart';
import 'app/themes/dark_theme.dart';
import 'app/themes/light_theme.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalizationController.to.initializeAllLanguages();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xfff3f3f4),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ThemeController(),
        builder: (themeController) {
          return GetBuilder(
              init: LocalizationController(),
              builder: (localizeController) {
                return GetBuilder(
                    init: MainController(),
                    builder: (mainController) {
                      return Obx(() => GetMaterialApp(
                          title: "Kalpas",
                          debugShowCheckedModeBanner: false,
                          navigatorKey: Get.key,
                          scrollBehavior:
                              const MaterialScrollBehavior().copyWith(
                            dragDevices: {
                              PointerDeviceKind.mouse,
                              PointerDeviceKind.touch
                            },
                          ),
                          theme: themeController.darkTheme ? dark : light,
                          locale: localizeController.locale,
                          translations: Messages(
                              languages: localizeController.allLanguage),
                          fallbackLocale: Locale(languages[0].languageCode!,
                              languages[0].countryCode),
                          initialRoute: '/',
                          // home: Login(),
                          getPages: AppRoutes.routes,
                          defaultTransition: Transition.topLevel,
                          transitionDuration: const Duration(milliseconds: 500),
                          builder: (BuildContext context, widget) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(),
                              child:
                                  Material(child: Stack(children: [widget!])),
                            );
                          }));
                    });
              });
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
