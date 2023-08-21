import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('새 게시물'),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
            actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '다음',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        ]));
  }
}
