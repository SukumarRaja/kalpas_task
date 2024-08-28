import 'package:flutter/material.dart';

import '../../themes/font_size.dart';
import 'common/text.dart';

class ForgotMethodCard extends StatelessWidget {
  const ForgotMethodCard(
      {super.key,
      required this.title,
      required this.phone,
      required this.icon,
      required this.onTap});

  final String title;
  final String phone;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
            const EdgeInsets.symmetric(vertical: AppFontSize.paddingSizeSmall),
        padding: const EdgeInsets.symmetric(
            vertical: AppFontSize.paddingSizeDefault,
            horizontal: AppFontSize.paddingSizeSmall),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.070),
            borderRadius: BorderRadius.circular(AppFontSize.radiusDefault)),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Theme.of(context).cardColor),
                child: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                )),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: title,
                  fontSize: AppFontSize.fontSizeSmall,
                  fontColor: Theme.of(context).hintColor,
                ),
                CommonText(
                  text: phone,
                  fontSize: AppFontSize.fontSizeDefault,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
