import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard.dart';
import '../../../controllers/main.dart';
import 'home.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final pages = [
    const Home(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    DashboardController.to.getNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      // This dialog will exit your app on saying yes
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              title: const Center(
                  child: Text(
                'Are you sure?',
                style: TextStyle(fontFamily: 'medium'),
              )),
              content: const Text('Do you want to exit an App'),
              contentTextStyle: TextStyle(
                  fontFamily: 'medium', color: Theme.of(context).hintColor),
              titleTextStyle: TextStyle(
                  fontFamily: 'medium',
                  color: Theme.of(context).primaryColor,
                  fontSize: 16),
              actions: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Theme.of(context).hintColor,
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'No',
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontFamily: 'medium'),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return DefaultTabController(
      length: MainController.to.tabLength,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: TabBar(
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).cardColor,
              unselectedLabelColor: const Color.fromARGB(255, 185, 196, 207),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              labelStyle: const TextStyle(
                fontFamily: 'regular',
                fontSize: 10,
              ),
              onTap: (int index) {
                MainController.to.currentIndex = index;
              },
              tabs: [
                Tab(
                  icon: buildIcon(icon: Icons.home_outlined, index: 0),
                  // text: "Home",
                ),
                Tab(
                  icon: buildIcon(icon: Icons.factory_outlined, index: 1),
                ),
                Tab(
                  icon: buildIcon(icon: Icons.person_2_outlined, index: 2),
                ),
              ],
            ),
            body: Obx(() => pages[MainController.to.currentIndex])),
      ),
    );
  }

  buildIcon({required icon, required index}) {
    return Obx(() => Icon(
          icon,
          size: 28,
          color: MainController.to.currentIndex == index
              ? Theme.of(context).primaryColor
              : const Color.fromARGB(255, 185, 196, 207),
        ));
  }
}
