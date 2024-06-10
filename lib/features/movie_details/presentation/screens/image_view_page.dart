import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_box/core/utils/utils.dart';

class ImageViewPage extends StatelessWidget {
  final String imagePath;
  const ImageViewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          fit: BoxFit.cover,
          imageUrl: getOriginalPosterUrl(imagePath),
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error,
              size: 50,
            );
          },
        ),
      ),
    );
  }
}
