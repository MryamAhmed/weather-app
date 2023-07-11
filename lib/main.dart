import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubts/weathe_cubit/weather_cubit.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/serveses/weather_servises.dart';

void main() {
  runApp( BlocProvider(
      create: (context){
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp()
  )
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel==null? Colors.blue: BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor() ,
      ),
      home:HomePage() ,
    );
  }
}
