import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/controller/search_focus_controller.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool focus;
  const SearchTextField(
      {super.key, required this.controller, required this.focus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: TextField(
        autofocus: focus,
        onSubmitted: Get.find<SearchFocusController>().submitted,
        controller: controller,
        cursorColor: const Color(0xff7f7f7f),
        decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0),
                gapPadding: 0.0),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0),
                gapPadding: 0.0),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0),
                gapPadding: 0.0),
            hintText: '검색',
            hintStyle: const TextStyle(fontSize: 18),
            focusColor: const Color(0xff7d7d7d),
            prefixIcon: const Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(
                Icons.search,
                size: 20,
              ),
            )),
      ),
    );
  }
}
