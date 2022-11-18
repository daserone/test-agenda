import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/weather_model.dart';
import 'package:test/data/services/weather_service.dart';
import 'package:test/domain/provider/position_provider.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherData;
  bool loading = false;
  String _rainProb = '';

  setRaingProb(String wheaterDesc) {
    log(wheaterDesc);
    _rainProb = wheaterDesc;
    notifyListeners();
  }

  String get rainProb {
    return _rainProb;
  }

  getWeather(BuildContext context) async {
    final posiProvider = Provider.of<PositionProvider>(context, listen: false);
    loading = true;
    weatherData = await getWeatherData(posiProvider.location?.latitude ?? 0.0,
        posiProvider.location?.longitude ?? 0.0);
    setRaingProb(
        weatherData?.weather?.first.description ?? 'error al cargar datos');
    loading = false;

    notifyListeners();
  }
}
