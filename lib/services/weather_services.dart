import 'package:weather_app/apis/get_api.dart';
import 'package:weather_app/app/app.locator.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherService {
  final GetApis _getApis = locator<GetApis>();
  Future<WeatherModel> getWeatherDataForCity(String cityName) async {
    try {
      WeatherModel weatherResponse = await _getApis.getWeatherForCity(cityName);
      return weatherResponse;
    } catch (e) {
      rethrow;
    }
  }
}
