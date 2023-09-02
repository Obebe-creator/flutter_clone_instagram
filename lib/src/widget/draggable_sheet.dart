import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/avatar_widget.dart';
import 'package:get/get.dart';

class DraggableSheet extends StatefulWidget {
  final DraggableScrollableController controller;
  const DraggableSheet({super.key, required this.controller});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final double _maxheight = Get.size.height * 0.9;
  final double _minheight = Get.size.height * 0.6;
  late double _currentHeight = _maxheight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _currentHeight,
      duration: const Duration(seconds: 500),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < 0) {
                setState(() {
                  _currentHeight = _minheight;
                });
              } else if (details.delta.dy > 0) {
                setState(() {
                  _currentHeight = _maxheight;
                });
              }
            },
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '댓글',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              ImageAvatar(
                                  url:
                                      'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
                                  type: AvatarType.BASIC),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text(
                                  '$index _user',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  '$index 번째 댓글입니다.',
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text(
                                  '답글 달기',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
