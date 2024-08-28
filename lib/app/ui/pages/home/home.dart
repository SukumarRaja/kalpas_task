import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/shimmers/order.dart';
import '../../widgets/common/text.dart';
import '../../widgets/home/news_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await DashboardController.to.getNews();
      },
      child: GetBuilder(
          init: DashboardController(),
          builder: (controller) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Theme.of(context).cardColor,
                body: Stack(
                  children: [
                    /// title card
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 10, left: 10),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: buildTitleBar(context,
                                    text: "News",
                                    icon: Icons.menu,
                                    iconColor: Colors.black,
                                    index: 0, onTap: () {
                              DashboardController.to.titleIndex = 0;
                            })),
                            const SizedBox(width: AppFontSize.paddingSizeSmall),
                            Expanded(
                                child: buildTitleBar(context,
                                    text: "Favs",
                                    icon: Icons.favorite,
                                    index: 1,
                                    iconColor: Colors.red, onTap: () {
                              DashboardController.to.titleIndex = 1;
                            })),
                          ],
                        ),
                      ),
                    ),

                    /// news data in api
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppFontSize.paddingSizeDefault,
                            vertical: AppFontSize.paddingSizeDefault),
                        children: [
                          const SizedBox(
                              height: AppFontSize.paddingSizeDefault),
                          Obx(() => DashboardController.to.titleIndex == 0
                              ? DashboardController.to.getNewsLoading == true
                                  ? ListView.builder(
                                      itemCount: 5,
                                      shrinkWrap: true,
                                      itemBuilder: (context, ind) {
                                        return CommonShimmer(
                                            isEnabled: DashboardController
                                                .to.getNewsLoading);
                                      },
                                    )
                                  : DashboardController.to.newsList.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: DashboardController
                                              .to.newsList.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return NewsCard(
                                              data: DashboardController
                                                  .to.newsList[index],
                                              isFavourite: false,
                                            );
                                          })
                                      : const Text("No Data")
                              : const SizedBox.shrink()),

                          ///favourite list
                          Obx(() => DashboardController.to.titleIndex == 1
                              ? DashboardController.to.favourite.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: DashboardController
                                          .to.favourite.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return NewsCard(
                                          data: DashboardController
                                              .to.favourite[index],
                                          isFavourite: true,
                                        );
                                      })
                                  : const Text("No data")
                              : const SizedBox.shrink())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  buildTitleBar(BuildContext context, {text, icon, onTap, iconColor, index}) {
    return GestureDetector(
        onTap: onTap,
        child: Obx(
          () => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
                vertical: AppFontSize.paddingSizeSmall),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: DashboardController.to.titleIndex == index
                  ? Theme.of(context).primaryColor.withOpacity(.06)
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: iconColor),
                const SizedBox(width: AppFontSize.paddingSizeSmall),
                CommonText(
                  text: "$text",
                  fontSize: AppFontSize.fontSizeOverLarge,
                ),
              ],
            ),
          ),
        ));
  }
}
