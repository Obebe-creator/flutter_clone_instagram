import 'package:flutter_clone_inst/src/controller/search_focus_controller.dart';
import 'package:get/get.dart';

class SearchFocusBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchFocusController());
  }
}
