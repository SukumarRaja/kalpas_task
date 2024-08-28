import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/font_size.dart';
import '../../utility/utility.dart';
import '../widgets/common/asset_image.dart';
import '../widgets/common/text.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({super.key, this.data});

  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios, size: 20),
              CommonText(text: "Back", fontSize: AppFontSize.fontSizeLarge),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: AppFontSize.paddingSizeDefault,
            vertical: AppFontSize.paddingSizeDefault),
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: '${data['urlToImage']}',
                imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                          strokeWidth: 3, color: Theme.of(context).cardColor)),
                ),
                errorWidget: (context, url, error) => CommonAssetImageCard(
                  "assets/images/no_image.webp",
                  height: 80,
                  width: Get.width,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppFontSize.paddingSizeLarge),
          CommonText(
            text: "${data['title']}",
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
            fontSize: AppFontSize.fontSizeExtraLarge,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: 20,
                color: Theme.of(context).hintColor,
              ),
              const SizedBox(width: 2),
              CommonText(
                text: "${convertDate(date: "${data['publishedAt']}")}",
                fontSize: AppFontSize.fontSizeSmall,
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                fontColor: Theme.of(context).hintColor,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          const SizedBox(height: AppFontSize.paddingSizeLarge),
          CommonText(
            text: "${data['description']}",
            fontSize: AppFontSize.fontSizeSmall,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
