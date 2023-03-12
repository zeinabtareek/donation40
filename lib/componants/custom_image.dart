import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomImage({
    super.key,
    this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Image.asset(
          'assets/images/placeholder.png',
          height: height,
          width: width,
          fit: fit),
      errorWidget: (context, url, error) => Image.asset(
          'assets/images/placeholder.png',
          height: height,
          width: width,
          fit: fit),
    );
  }
}
