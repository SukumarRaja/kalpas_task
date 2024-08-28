import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../themes/font_size.dart';

class CommonShimmer extends StatelessWidget {
  final bool isEnabled;

  const CommonShimmer({Key? key, required this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      enabled: isEnabled,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(AppFontSize.paddingSizeSmall),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(height: 15, width: 100, color: Colors.grey[300]),
              const SizedBox(height: AppFontSize.paddingSizeExtraSmall),
              Container(height: 10, width: 150, color: Colors.grey[300]),
            ]),
            Icon(Icons.keyboard_arrow_right,
                size: 30, color: Theme.of(context).disabledColor),
          ]),
        ),
        Divider(color: Theme.of(context).disabledColor),
      ]),
    );
  }
}
