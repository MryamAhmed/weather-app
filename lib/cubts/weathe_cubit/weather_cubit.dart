import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubts/weathe_cubit/weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import '../../serveses/weather_servises.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName})async{
    emit(WeatherLoadingState());
    try{
      weatherModel =await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch(e){
      emit(WeatherFailureState());
        }
  }
}
