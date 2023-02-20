import 'package:flutter/material.dart';

import '../../../ui_helpers/ui_helpers.dart';

class NameAndDatePartWidget extends StatelessWidget {
  final String cityName;
  final String country;
  const NameAndDatePartWidget(
      {super.key, required this.cityName, required this.country});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$cityName, $country",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 37, color: Colors.white),
        ),
        SizedBox(
          height: screenHeight(context) * 0.01,
        ),
        const Text(
          "MONDAY 7:00 AM",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
        ),
        SizedBox(
          height: screenHeight(context) * 0.02,
        ),
      ],
    );
  }
}
