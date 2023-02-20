import 'package:flutter/material.dart';

import '../../../ui_helpers/ui_helpers.dart';

class BottomPartWidget extends StatelessWidget {
  final int pressure;
  final double windSpeed;
  final double feelsLikeTemp;
  const BottomPartWidget(
      {super.key,
      required this.pressure,
      required this.windSpeed,
      required this.feelsLikeTemp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenHeight(context) * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.speed,
                  color: Colors.white,
                ),
                const Text(
                  "PRESSURE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$pressure Pa",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Text(
              "|",
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: [
                const Icon(
                  Icons.wind_power,
                  color: Colors.white,
                ),
                const Text(
                  "WIND",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${windSpeed.toStringAsFixed(0)} m/s",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Text(
              "|",
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: [
                const Icon(
                  Icons.device_thermostat,
                  color: Colors.white,
                ),
                const Text(
                  "TEMPRATURE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${(feelsLikeTemp - 273.15).toStringAsFixed(0)}°C",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
