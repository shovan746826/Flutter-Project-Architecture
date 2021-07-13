import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageData;

  const ImageCard({required this.imageData});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(
        imageData,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: Container(
                height: 250,
                width: 250,
                child: Center(child: CircularProgressIndicator())
            ),
          );
        },
      ),
    );
  }
}

