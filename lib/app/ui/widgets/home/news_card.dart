import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard.dart';
import '../../../themes/font_size.dart';
import '../../../utility/utility.dart';
import '../../pages/news_details.dart';
import '../common/asset_image.dart';
import '../common/text.dart';

class NewsCard extends StatefulWidget {
  NewsCard({super.key, this.data, required this.isFavourite});

  dynamic data;
  bool isFavourite;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => NewsDetail(data: widget.data));
      },
      child: Slidable(
        key: UniqueKey(),
        endActionPane: widget.isFavourite == false
            ? ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      controller.close();
                      DashboardController.to.addOrRemoveFavourite(
                          data: widget.data, context: context);
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.favorite,
                    label: 'Add to\nFavorite',
                    padding: EdgeInsets.zero,
                  ),
                ],
              )
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppFontSize.paddingSizeDefault,
              horizontal: AppFontSize.paddingSizeDefault),
          margin: const EdgeInsets.only(bottom: AppFontSize.paddingSizeDefault),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: '${widget.data['urlToImage']}',
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
                                strokeWidth: 3,
                                color: Theme.of(context).cardColor)),
                      ),
                      errorWidget: (context, url, error) =>
                          CommonAssetImageCard(
                        "assets/images/no_image.webp",
                        height: 80,
                        width: Get.width,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppFontSize.paddingSizeSmall),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    CommonText(
                      text: "${widget.data['title']}",
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    CommonText(
                      text: "${widget.data['content']}",
                      fontSize: AppFontSize.fontSizeSmall,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 20,
                          color: Theme.of(context).hintColor,
                        ),
                        const SizedBox(width: 2),
                        CommonText(
                          text:
                              "${convertDate(date: "${widget.data['publishedAt']}")}",
                          fontSize: AppFontSize.fontSizeSmall,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          fontColor: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
