import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.status,
    required this.iconWidget,
  });
  final String imagePath;
  final String name;
  final String status;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 200,
      child: Card(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                CachedNetworkImage(
                  height: 200,
                  imageUrl: imagePath,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),

                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 2),
                Text(name, textAlign: TextAlign.center),
                Text(status),
              ],
            ),
            Positioned(top: 0, right: 0, child: iconWidget),
          ],
        ),
      ),
    );
  }
}
