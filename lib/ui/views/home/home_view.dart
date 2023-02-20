import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/views/home/components/bottomPart.dart';
import 'package:weather_app/ui/views/home/components/imageAndTemperaturePart.dart';
import 'package:weather_app/ui/views/home/components/nameAndDatePart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../ui_helpers/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.getForFirstTime(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            body: SafeArea(
                child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.06,
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: model.cityController,
                onChanged: model.onCityChanged,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: const EdgeInsets.all(12),
                    suffixIcon: IconButton(
                        onPressed: model.getWeatherDataForCity,
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    hintText: "Enter City..",
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.02,
            ),
            model.isBusy
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight(context) * 0.2),
                    child: Center(
                      child: SpinKitFadingCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven ? Colors.red : Colors.green,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : model.modelError ?? true
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight(context) * 0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              " Error",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: model.getWeatherDataForCity,
                                icon: const Icon(
                                  Icons.refresh,
                                  size: 40,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NameAndDatePartWidget(
                                cityName: model.weatherModel.name!,
                                country: model.weatherModel.sys!.country!),
                            ImageAndTempraturePart(
                              imageUrl: model.getImageUrlForWeather(
                                  model.weatherModel.weather![0].icon!),
                              cloudType: model.weatherModel.weather![0].main!,
                              tempratureData:
                                  model.getTempratureValue(model.weatherModel),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(context) * 0.3,
                                  vertical: 5),
                              child: const Divider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            BottomPartWidget(
                                pressure: model.weatherModel.main!.pressure!,
                                windSpeed: model.weatherModel.wind!.speed!,
                                feelsLikeTemp:
                                    model.weatherModel.main!.feelsLike!)
                          ],
                        ),
                      ),
          ],
        )));
      },
    );
  }
}
