import 'package:flutter/foundation.dart';

import '../models/weather_model.dart';

class WearherProvider extends ChangeNotifier{

  WeatherModel? _weatherFromProvider;

  String?cityName;


  set  weatherFromProvider(WeatherModel? weather){
    _weatherFromProvider = weather;
    notifyListeners();
  }

  WeatherModel?  get   weatherFromProvider => _weatherFromProvider;


}