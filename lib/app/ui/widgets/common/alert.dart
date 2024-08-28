import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

class CommonAlert extends StatelessWidget {
  const CommonAlert(
      {super.key,
      this.title = "",
      required this.description,
      required this.onPressed});

  final String title;
  final String description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppFontSize.radiusSmall)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(AppFontSize.paddingSizeLarge),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              title != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppFontSize.paddingSizeLarge),
                      child: CommonText(
                        text: description,
                        fontSize: AppFontSize.fontSizeExtraLarge,
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(AppFontSize.paddingSizeLarge),
                child: CommonText(
                  text: description,
                  fontSize: AppFontSize.fontSizeLarge,
                ),
              ),
              const SizedBox(height: AppFontSize.paddingSizeLarge),
              Row(children: [
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).disabledColor.withOpacity(0.3),
                    minimumSize: const Size(1170, 40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppFontSize.radiusSmall)),
                  ),
                  child: CommonText(
                    text: 'no'.tr,
                    fontColor: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                )),
                const SizedBox(width: AppFontSize.paddingSizeLarge),
                Expanded(
                    child: TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(1170, 40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppFontSize.radiusSmall)),
                  ),
                  child: CommonText(
                    text: 'yes'.tr,
                    fontColor: Theme.of(context).cardColor,
                  ),
                )),
              ])
            ]),
          )),
    );
  }
}
