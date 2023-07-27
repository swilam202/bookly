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
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Image.network(
          image ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2ZulU0oYKRCJZ9eG5aLjsL&ust=1690552119486000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMiQ1caDr4ADFQAAAAAdAAAAABAL',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
