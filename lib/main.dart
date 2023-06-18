import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/provider/weatherData.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return WearherProvider();
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
        primarySwatch: Provider.of<WearherProvider>(context).weatherFromProvider==null? Colors.blue: Provider.of<WearherProvider>(context).weatherFromProvider!.getThemeColor() ,
      ),
      home:HomePage() ,
    );
  }
}
