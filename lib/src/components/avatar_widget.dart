import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';

enum AvatarType { ON, OFF, STORY, BASIC, MYSTORY }

class ImageAvatar extends StatelessWidget {
  final double width;
  final String url;
  final AvatarType type;
  final void Function()? onTap;
  const ImageAvatar(
      {super.key,
      this.width = 30,
      required this.url,
      required this.type,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      AvatarType.STORY => _storyAvatar(),
      AvatarType.ON => _onImage(),
      AvatarType.OFF => _offImage(),
      AvatarType.BASIC => _basickImage(),
      AvatarType.MYSTORY => _myStoryAvatar(),
    };
  }

  Widget _storyAvatar() {
    return Container(
        padding: const EdgeInsets.all(3.5),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfffce80a),
                  Color(0xfffc4a0a),
                  Color(0xffc80afc),
                ])),
        child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: _basickImage()));
  }

  Widget _offImage() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100.0)),
      child: _basickImage(),
    );
  }

  Widget _onImage() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(100.0)),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(100.0)),
        child: _basickImage(),
      ),
    );
  }

  Widget _basickImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(65),
      child: SizedBox(
        width: width,
        height: width,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _myStoryAvatar() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(3.5),
          child: Stack(
            children: [
              _basickImage(),
              Positioned(
                bottom: 0.5,
                right: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: ImageData(width: 65, path: IconsPath.addStory),
                ),
              ),
            ],
          )),
    );
  }
}
