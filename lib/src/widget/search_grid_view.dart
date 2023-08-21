import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchGridView extends StatelessWidget {
  final Widget child;
  const SearchGridView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final List<QuiltedGridTile> patternOne = [
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(2, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
    ];

    final List<QuiltedGridTile> patternTwo = [
      const QuiltedGridTile(2, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
    ];

    final List<QuiltedGridTile> patternThree = [
      const QuiltedGridTile(2, 2),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
    ];

    return SliverGrid.builder(
      gridDelegate: SliverQuiltedGridDelegate(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 3,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          ...patternOne,
          ...patternTwo,
          ...patternOne,
          ...patternThree,
          ...patternOne,
          ...patternTwo,
          ...patternOne,
          ...patternTwo,
          // //패턴 1
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 2
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 3
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 4
          // const QuiltedGridTile(2, 2),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 5
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 6
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 7
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // //패턴 8
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
          // const QuiltedGridTile(1, 1),
        ],
      ),
      itemCount: 100,
      itemBuilder: (context, index) => Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: child,
      ),
    );
  }
}
