import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/app/app.locator.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/weather_services.dart';

class HomeViewModel extends BaseViewModel {
  final WeatherService _weatherService = locator<WeatherService>();
  WeatherModel _weatherModel = WeatherModel();
  WeatherModel get weatherModel => _weatherModel;
  String _cityName = "London";
  String get cityName => _cityName;
  final TextEditingController _cityController = TextEditingController();
  TextEditingController get cityController => _cityController;

  getWeatherForRequestedCity() async {
    return await _weatherService.getWeatherDataForCity(_cityName);
  }

  Future getForFirstTime() async {
    try {
      setBusy(true);
      _weatherModel = await _weatherService.getWeatherDataForCity(_cityName);

      setBusy(false);
      notifyListeners();
    } catch (e) {
      setBusy(false);
      setError(true);
      notifyListeners();
      throw Exception("There is Something going bad");
    }
  }

  Future getWeatherDataForCity() async {
    if (_cityController.text == "") return;

    try {
      setBusy(true);
      _weatherModel =
          await _weatherService.getWeatherDataForCity(_cityName.trim());
      setBusy(false);
      setError(false);
      notifyListeners();
    } catch (e) {
      setBusy(false);
      setError(true);
      notifyListeners();
      throw Exception("There is Something going bad");
    }
    _cityController.clear();
    // setBusy(false);
  }

  String getImageUrlForWeather(String code) {
    return "http://openweathermap.org/img/wn/$code@2x.png";
  }

  String getTempratureValue(WeatherModel? data) {
    return (data!.main!.temp! - 273.15).toStringAsFixed(0);
  }

  void onCityChanged(String value) {
    _cityName = value;
    notifyListeners();
  }
}
