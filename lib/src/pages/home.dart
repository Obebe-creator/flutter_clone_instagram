import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/avatar_widget.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:flutter_clone_inst/src/widget/feed.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _appbar(),
            _story(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return SliverAppBar(
      floating: true,
      title: ImageData(
        path: IconsPath.logo,
        width: 300,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: IconsPath.active),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: IconsPath.dm),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return SliverList.builder(
      itemCount: 50,
      itemBuilder: (context, index) => const Feed(
        userUrl:
            'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
        userName: '_hyeon00',
        images: [
          'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
          'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
          'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
        ],
        countComment: 8,
        countLikes: 12,
      ),
    );
  }

  Widget _story() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ImageAvatar(
                    url:
                        'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
                    width: Get.size.width * 0.2,
                    type: AvatarType.MYSTORY),
              ),
              const Padding(
                padding: EdgeInsets.all(3.5),
                child: Text('내 스토리'),
              )
            ],
          ),
          ...List.generate(
            20,
            (index) => SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.5),
                    child: ImageAvatar(
                      width: Get.size.width * 0.2,
                      type: AvatarType.STORY,
                      url:
                          'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$index번째 사용자',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
