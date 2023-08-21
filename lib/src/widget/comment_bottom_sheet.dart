import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/avatar_widget.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        const Divider(
          height: 10,
          color: Colors.black26,
        ),
        _comment(),
      ],
    );
  }

  Widget _header() {
    return const Center(
      child: Text(
        '댓글',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _comment() {
    return Expanded(
      child: ListView.builder(
          itemCount: 50,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.all(2.0),
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
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            '답글 달기',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
