import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/controller/search_focus_controller.dart';
import 'package:flutter_clone_inst/src/widget/search_text_field.dart';
import 'package:get/get.dart';

class SearchResult extends GetView<SearchFocusController> {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SearchTextField(
            focus: false, controller: controller.searchController),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            height: AppBar().preferredSize.height,
            width: Size.infinite.width,
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontSize: 15),
              unselectedLabelStyle: const TextStyle(fontSize: 15),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.black,
              indicatorWeight: 1.0,
              controller: controller.tabController,
              tabs: controller.tabs,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          Center(
            child: Text('추천페이지'),
          ),
          Center(
            child: Text('계정페이지'),
          ),
          Center(
            child: Text('릴스페이지'),
          ),
          Center(
            child: Text('오디오페이지'),
          ),
          Center(
            child: Text('태그페이지'),
          ),
          Center(
            child: Text('장소페이지'),
          ),
        ],
      ),
    );
  }
}
