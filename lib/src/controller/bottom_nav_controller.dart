import 'dart:io';
import 'package:flutter_clone_inst/src/binding/upload_binding.dart';
import 'package:get/get.dart';
import '../pages/upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class BottomNavController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  final List<int> _history = [0];

  int get pageIndex => _pageIndex.value;

  void changeIndex(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.REELS:
      case PageName.MYPAGE:
        moveToPage(value);
      case PageName.UPLOAD:
        moveToUpload();
    }
  }

  void moveToPage(int value) {
    if (_history.last != value && Platform.isAndroid) {
      // Android에서 _history의 마지막 값이 value 값과 다를 때
      _history.add(value); //value 값을 넣어준다
    }
    _pageIndex(value);
  }

  Future<bool> popAction() async {
    if (_history.length == 1) {
      // history가 1일 경우
      return true; // 뒤로가기 가능
    } else {
      // history가 1이 아닐 경우
      _history.removeLast(); // 가장 최근 페이지 이력 제거
      _pageIndex(_history.last); // 가장 최근 페이지로 이동
      return false; // 뒤로가기 x
    }
  }

  void moveToUpload() {
    Get.to(() => const Upload(), binding: UploadBiding());
  }
}
