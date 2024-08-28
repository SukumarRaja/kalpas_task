import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/button.dart';
import '../../widgets/common/social_icon_button.dart';
import '../../widgets/common/text.dart';
import '../../widgets/common/textform_field.dart';
import '../home/main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login.png',
                  height: 340,
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: Container(
              //     margin: const EdgeInsets.all(15),
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //         borderRadius:
              //             BorderRadius.circular(AppFontSize.radiusDefault),
              //         color: Theme.of(context).primaryColor.withOpacity(.070)),
              //     child: Icon(
              //       Icons.arrow_back_ios_new,
              //       size: 24,
              //       color: Theme.of(context).hintColor,
              //     ),
              //   ),
              // )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppFontSize.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'sign_account',
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.fontSizeOverLarge,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    CommonTextFormField(
                        hintText: 'email'.tr,
                        controller: AuthController.to.lPhone),
                    CommonTextFormField(
                      hintText: "password".tr,
                      controller: AuthController.to.lPassword,
                      obscureText: true,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CommonButton(text: "sign_in", onPressed: () {
                  Get.to(()=>HomeMain());
                }),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/forgot_password');
                      },
                      child: CommonText(
                        text: 'forgot_password',
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.fontSizeDefault,
                        fontColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Divider(
                          thickness: 2,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CommonText(
                        text: "Or continue with",
                        fontColor: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Expanded(
                        flex: 2,
                        child: Divider(
                          thickness: 2,
                        )),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIconButton(image: "google.jpg"),
                  SocialIconButton(image: "facebook.png"),
                  SocialIconButton(image: "insta.png"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: 'dont_have_account',
                    fontSize: AppFontSize.fontSizeDefault,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: CommonText(
                      text: 'sign_up',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                      fontColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
