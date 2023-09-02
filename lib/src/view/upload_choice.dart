import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/controller/upload_controller.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadChoice extends GetView<UploadController> {
  const UploadChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: Get.back,
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.black, fontSize: 18),
            )),
        title: const Text('사진첩 선택'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      body: Obx(() => ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: AssetEntityImage(
                          controller.albums[index].images![0],
                          fit: BoxFit.cover,
                          isOriginal: true,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.albums[index].name!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text('${controller.albums[index].images!.length}')
                        ],
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
