import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void showBottomModal() {
    Get.bottomSheet(
        Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.1,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  height: 3.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      color: Colors.black26),
                ),
              ),
            ),
            const Center(
              child: Text(
                '댓글',
                style: TextStyle(fontSize: 18),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
