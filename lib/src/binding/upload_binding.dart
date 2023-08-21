import 'package:flutter_clone_inst/src/controller/upload_controller.dart';
import 'package:get/get.dart';

class UploadBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(UploadController());
  }
}
