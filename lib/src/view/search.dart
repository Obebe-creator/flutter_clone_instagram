import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/binding/search_focus_binding.dart';
import 'package:flutter_clone_inst/src/view/search_focus.dart';
import 'package:flutter_clone_inst/src/widget/search_grid_view.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appbar(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return SliverAppBar(
      floating: true,
      title: InkWell(
        //Container와 같이 제스쳐기능을 제공하지 않는 위젯을 래핑하여 onTap 기능 제공, 위젯을 tap하면 물결모양 이펙트 제공
        highlightColor: Colors.black26,
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Get.to(() => const SearchFocus(),
              transition: Transition.fadeIn,
              binding: SearchFocusBinding(),
              id: 1);
        },
      ),
    );
  }

  Widget _body() {
    return SearchGridView(
      child: CachedNetworkImage(
        imageUrl:
            'https://i.pinimg.com/564x/5a/cb/db/5acbdbe70f3fcc2d14d95349a2a02c98.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
