import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image loading state.dart';


class BookImage extends StatelessWidget {
  const BookImage({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image ?? '',
          placeholder: (context, url) => const Center(child: ImageLoading()),
          errorWidget: (context, url, error) => const Icon(Icons.image),
        ),
      ),
    );
  }
}
