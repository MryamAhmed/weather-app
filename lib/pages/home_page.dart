import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/search_page.dart';

import '../models/weather_model.dart';
import '../provider/weatherData.dart';

class HomePage  extends StatefulWidget {
   HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData ;

 @override
  Widget build(BuildContext context) {

   WeatherModel? weatherData = Provider.of<WearherProvider>(context).weatherFromProvider;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SearchPage();
              }));
              }, icon: const Icon(Icons.search))
          ],
        ),
      body:  weatherData  == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
     :Center(
       child: Container(
         decoration: BoxDecoration(
           color: weatherData.getThemeColor(),
           gradient: LinearGradient(
             colors: [
               weatherData.getThemeColor(),
               weatherData.getThemeColor()[300]!,
               weatherData.getThemeColor()[100]!,
             ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
           )
         ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Text(Provider.of<WearherProvider>(context).cityName!,
                style:
                const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'updated at: ${weatherData!.data}',
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(weatherData!.getImage()),
                  Text(
                    '${weatherData.temp.toInt()}',
                    style:
                    const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('max temp: ${weatherData.maxTemp.toInt()}'),
                      Text('min temp: ${weatherData.minTemp.toInt()}')
                    ],
                  )
                ],
              ),
              const Spacer(),
              Text(
                '${weatherData!.weatherStateName}',
                style:
                const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Spacer(flex: 5,)
            ],
          ),
        ),
     )
    );
  }
}
