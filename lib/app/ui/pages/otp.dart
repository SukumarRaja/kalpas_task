import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controllers/auth.dart';
import '../../themes/font_size.dart';
import '../widgets/common/button.dart';
import '../widgets/common/text.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppFontSize.radiusDefault),
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(.070)),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      CommonText(
                        text: 'otp_verification',
                        fontSize: AppFontSize.fontSizeExtraLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
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
                  Center(
                    child: Image.asset(
                      'assets/images/forgot.png',
                      height: 280,
                    ),
                  ),

                  SizedBox(height: media.height * 0.05),
                  Align(
                    alignment: Alignment.center,
                    child: CommonText(
                      text: 'enter_the_verification_sent_to',
                      fontSize: AppFontSize.fontSizeLarge,
                      fontColor: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(.5),
                    ),
                  ),
                  const SizedBox(height: AppFontSize.paddingSizeDefault),
                  Align(
                    alignment: Alignment.center,
                    child: CommonText(
                      text: "+91 ${AuthController.to.lPhone.text}",
                      fontSize: AppFontSize.fontSizeDefault,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: AppFontSize.paddingSizeOverLarge),

                  PinCodeTextField(
                    length: 6,
                    appContext: context,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.slide,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 50,
                      fieldWidth: 50,
                      borderWidth: 1,
                      borderRadius:
                          BorderRadius.circular(AppFontSize.radiusSmall),
                      selectedColor:
                          Theme.of(context).primaryColor.withOpacity(0.2),
                      selectedFillColor: Colors.white,
                      inactiveFillColor:
                          Theme.of(context).disabledColor.withOpacity(0.2),
                      inactiveColor:
                          Theme.of(context).primaryColor.withOpacity(0.2),
                      activeColor:
                          Theme.of(context).primaryColor.withOpacity(0.4),
                      activeFillColor:
                          Theme.of(context).disabledColor.withOpacity(0.2),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged: (data) {
                      print("kljkljkl ${data}");
                      // OtpController.to.otp = data;
                    },
                    beforeTextPaste: (text) => true,
                  ),
                  const SizedBox(height: AppFontSize.paddingSizeDefault),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonText(
                        text: 'resend',
                        fontSize: AppFontSize.fontSizeDefault,
                        fontColor: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: media.width * 0.02,
                      ),
                      CommonText(
                        text: 'in 20sec',
                        fontSize: AppFontSize.fontSizeSmall,
                        fontColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: media.height * 0.05),
                  // Obx(
                  //       () => OtpController.to.verifyingOtp == true
                  //       ? Center(
                  //       child: CircularProgressIndicator(
                  //         color: Theme.of(context).primaryColor,
                  //       ))
                  //       : CommonButton(
                  //       text: "verify",
                  //       onPressed: () {
                  //         OtpController.to.verifyOtp();
                  //       }),
                  // )
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
            child: CommonButton(text: 'continue', onPressed: () {})),
      ),
    );
  }
}
