import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';

import '../provider/weatherData.dart';
import '../serveses/weather_servises.dart';

class SearchPage extends StatelessWidget {


String? city_name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              city_name= data;
            },
            onSubmitted: (data) async{
              city_name= data;

              WeatherService service = WeatherService();

              WeatherModel? weather= await service.getweather(cityName: city_name!);
              print(weather);

              Provider.of<WearherProvider>(context,listen: false).weatherFromProvider=weather;
              Provider.of<WearherProvider>(context,listen: false).cityName=city_name;


              Navigator.pop(context);

            },
            decoration: InputDecoration(
              label: Text(
                  'search'
              ),
              hintText: ('Enter a City'),
              suffixIcon: IconButton(
                onPressed: ()async{
                  WeatherService service = WeatherService();

                  WeatherModel? weather= await service.getweather(cityName: city_name!);
                  print(weather);

                  Provider.of<WearherProvider>(context,listen: false).weatherFromProvider=weather;
                  Provider.of<WearherProvider>(context,listen: false).cityName=city_name;


                  Navigator.pop(context);
                },
                  icon: Icon((Icons.search))
                  ,
              ),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 24,vertical: 32),
            ),
          ),
        ),
      ),
    );
  }
}

