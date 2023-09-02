import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/view/search_result.dart';
import 'package:get/get.dart';

class SearchFocusController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late TabController _tab;

  @override
  void onInit() {
    super.onInit();
    _tab = TabController(length: _tabs.length, vsync: this);
  }

  final List<Widget> _tabs = [
    const Tab(
      text: '회원님을 위한 추천',
    ),
    const Tab(
      text: '계정',
    ),
    const Tab(
      text: '릴스',
    ),
    const Tab(
      text: '오디오',
    ),
    const Tab(
      text: '태그',
    ),
    const Tab(
      text: '장소',
    ),
  ];

  TextEditingController get searchController => _controller;
  TabController get tabController => _tab;
  List<Widget> get tabs => _tabs;

  void submitted(String value) {
    Get.off(() => const SearchResult(), id: 1);
  }
}
