import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/font_size.dart';
import '../widgets/common/button.dart';
import '../widgets/common/text.dart';
import '../widgets/forgot_mehtod_card.dart';
import 'otp.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                    'assets/images/forgot.png',
                    height: 340,
                  ),
                ),
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'forgot_password',
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fontSizeOverLarge,
                  ),
                  const SizedBox(height: 10),
                  CommonText(
                    text: 'to_reset',
                    fontSize: AppFontSize.fontSizeSmall,
                    fontColor: Theme.of(context).hintColor,
                  ),
                  const SizedBox(height: 10),
                  ForgotMethodCard(
                    icon: Icons.message,
                    title: 'via_sms',
                    phone: "+91 89084XXXXXX",
                    onTap: () {},
                  ),
                  ForgotMethodCard(
                    icon: Icons.mail,
                    title: 'via_mail',
                    phone: "shukik@gmail.com",
                    onTap: () {},
                  ),
                ],
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
            child: CommonButton(text: 'continue', onPressed: () {
              Get.to(()=>Otp());
            })),
      ),
    );
  }
}
