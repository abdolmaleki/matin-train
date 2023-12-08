import 'package:flutter/material.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage(
      {super.key,
      required this.imageProvider,
      this.width,
      this.height,
      this.borderRadius});

  final ImageProvider<Object> imageProvider;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius??BorderRadius.circular(8),
      child: Image(
        image: imageProvider,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
