import 'dart:developer';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../api/end_point.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    this.width,
    this.height,
    required this.imagePath,
    this.fit,
    this.emptyColorFilter,
    this.color,
  });

  final double? width, height;
  final String imagePath;
  final ColorFilter? emptyColorFilter;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      imageUrl: "${EndPoint.imageBaseUrl}$imagePath",
      // imageUrl: imagePath, // this for test only
      color: color,
      fadeInDuration: const Duration(milliseconds: 300),
      errorListener: (value) {
        log('Error loading image: $value');
      },
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Image.asset(AppImages.imagesNoImage),
      ),
      progressIndicatorBuilder: (context, url, progress) => SizedBox(
        width: 30,
        height: 30,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CircularProgressIndicator(value: progress.progress),
        ),
      ),
    );
  }
}
