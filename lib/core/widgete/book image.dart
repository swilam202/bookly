import 'package:bookly/core/widgete/loading%20state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookImage extends StatelessWidget {
   BookImage({super.key, this.image});

   String? image;
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
          placeholder: (context, url) => const Center(child:  LoadingState()),
          errorWidget: (context, url, error) => const Icon(Icons.image),
        ),
      ),
    );
  }
}
