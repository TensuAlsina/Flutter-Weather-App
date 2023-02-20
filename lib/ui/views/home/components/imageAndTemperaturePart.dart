import 'package:flutter/material.dart';

import '../../../ui_helpers/ui_helpers.dart';

class ImageAndTempraturePart extends StatelessWidget {
  final String imageUrl;
  final String tempratureData;
  final String cloudType;
  const ImageAndTempraturePart(
      {super.key,
      required this.imageUrl,
      required this.tempratureData,
      required this.cloudType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: NetworkImage(imageUrl)),
        SizedBox(
          height: screenHeight(context) * 0.02,
        ),
        Text(
          "$tempratureData°C",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 35, color: Colors.white),
        ),
        Text(
          cloudType,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ],
    );
  }
}
