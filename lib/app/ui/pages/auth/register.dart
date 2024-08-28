import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/button.dart';
import '../../widgets/common/intl_phone_field.dart';
import '../../widgets/common/text.dart';
import '../../widgets/common/textform_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppFontSize.radiusDefault),
                        color:
                            Theme.of(context).primaryColor.withOpacity(.070)),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 24,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'setup_account',
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fontSizeOverLarge,
                  ),
                  const SizedBox(height: 10),
                  CommonText(
                    text: 'complete_account',
                    fontSize: AppFontSize.fontSizeSmall,
                    fontColor: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.paddingSizeDefault),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Name',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Name", controller: AuthController.to.lPhone),
                    CommonText(
                      text: 'Email',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Email",
                        controller: AuthController.to.lPhone),
                    CommonText(
                      text: 'Phone',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: IntlPhoneField(
                        maxLength: 10,
                        hintText: "Phone",
                        controller: AuthController.to.lPhone,
                        initialCountryCode: "IN",
                        fontFamily: "medium",
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "Phone field required";
                          } else if (data.length < 10) {
                            return "Phone number must be 10 character";
                          }
                          return null;
                        },
                      ),
                    ),
                    CommonText(
                      text: 'Password',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                        hintText: "Password",
                        controller: AuthController.to.lPhone,
                        obscureText: true),
                    CommonText(
                      text: 'Confirm Password',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                    ),
                    CommonTextFormField(
                      hintText: "Confirm Password",
                      controller: AuthController.to.lPhone,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
                bottom: 20,
                right: AppFontSize.paddingSizeDefault,
                left: AppFontSize.paddingSizeDefault),
            // height: 50,
            child: CommonButton(text: 'save', onPressed: () {})),
      ),
    );
  }
}
