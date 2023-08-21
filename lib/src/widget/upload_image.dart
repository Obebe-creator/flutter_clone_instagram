import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class UPloadImage extends StatelessWidget {
  final AssetEntity entity;
  final BoxFit fit;
  const UPloadImage({super.key, required this.entity, required this.fit});

  @override
  Widget build(BuildContext context) {
    return AssetEntityImage(
      entity,
      fit: fit,
      isOriginal: false,
    );
  }
}
