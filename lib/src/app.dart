import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/avatar_widget.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:flutter_clone_inst/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_inst/src/pages/home.dart';
import 'package:flutter_clone_inst/src/view/search.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: controller.popAction,
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _bottom(),
        ),
      ),
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.pageIndex,
      children: [
        const Home(),
        Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: (settings) {
            return GetPageRoute(
              page: () => const Search(),
            );
          },
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _bottom() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.pageIndex,
      onTap: controller.changeIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.homeOff),
            activeIcon: ImageData(path: IconsPath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.searchOff),
            activeIcon: ImageData(path: IconsPath.searchOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.upload), label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.reelsOff),
            activeIcon: ImageData(path: IconsPath.reelsOn),
            label: 'home'),
        const BottomNavigationBarItem(
            icon: ImageAvatar(
              url:
                  'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
              type: AvatarType.OFF,
            ),
            activeIcon: ImageAvatar(
              type: AvatarType.ON,
              url:
                  'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
            ),
            label: 'home'),
      ],
    );
  }
}
