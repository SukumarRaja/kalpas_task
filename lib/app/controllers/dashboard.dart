import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import '../data/repositories/news.dart';
import 'main.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.put(DashboardController());

  ///repository
  final repository = NewsRepository();

  ///variable
  final _newsList = <dynamic>[].obs;

  get newsList => _newsList.value;

  set newsList(value) {
    _newsList.value = value;
  }

  final _getNewsLoading = false.obs;

  get getNewsLoading => _getNewsLoading.value;

  set getNewsLoading(value) {
    _getNewsLoading.value = value;
  }

  final _titleIndex = 0.obs;

  get titleIndex => _titleIndex.value;

  set titleIndex(value) {
    _titleIndex.value = value;
  }

  final _favourite = <dynamic>[].obs;

  get favourite => _favourite.value;

  set favourite(value) {
    _favourite.value = value;
  }

  getNews() async {
    getNewsLoading = true;
    var param =
        "top-headlines?sources=techcrunch&apiKey=${AppConfig.newsApiKey}";
    try {
      var res = await repository.getNews(params: param);

      if (statusCode == 200) {
        getNewsLoading = false;
        if (res['status'] == 'ok') {
          newsList = res['articles'];
          debugPrint("Successfully get news\ndata:$newsList");
        } else {
          debugPrint("${res['message']}");
        }
      } else {
        getNewsLoading = false;
        debugPrint("Failed to get news $statusCode");
      }
    } catch (e) {
      getNewsLoading = false;
      debugPrint("Error on get news $e");
    }
  }

  addOrRemoveFavourite({data, context}) {
    int index =
        favourite.indexWhere((element) => element['author'] == data['author']);
    if (index != -1) {
      favourite.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Removed from favourite')));
    } else {
      favourite.add(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Added to favourite')));
      update();
    }
    debugPrint("Updated favourite list: $favourite");
  }
}
