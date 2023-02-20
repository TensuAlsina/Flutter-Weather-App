import 'package:stacked/stacked_annotations.dart';
import 'package:weather_app/apis/get_api.dart';
import 'package:weather_app/services/weather_services.dart';

import '../ui/views/home/home_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
], dependencies: [
  LazySingleton(classType: GetApis),
  LazySingleton(classType: WeatherService)
])
class $App {}
