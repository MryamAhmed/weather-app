import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubts/weathe_cubit/weather_cubit.dart';
import 'package:weatherapp/cubts/weathe_cubit/weather_states.dart';
import 'package:weatherapp/pages/search_page.dart';

import '../models/weather_model.dart';

class HomePage  extends StatelessWidget {
   HomePage ({Key? key}) : super(key: key);
  WeatherModel? weatherData ;

 @override
  Widget build(BuildContext context) {

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

     body: BlocBuilder<WeatherCubit,WeatherStates>(
       builder: (context, state) {
         if(state is WeatherLoadingState)
         {
           return Center(
             child: CircularProgressIndicator(),
           );
         }else if(state is WeatherSuccessState){
           return successBody(
               weatherData: state.weatherModel
           );
         }else if(state is WeatherFailureState){
           return const Center(
             child: Text('something went wrong pless try again'),);
         }else{ //initial state
           return  const faieldBody();
         }
       },
     ),
    );
  }
}

class faieldBody extends StatelessWidget {
  const faieldBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
    );
  }
}

class successBody extends StatelessWidget {
  const successBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: weatherData?.getThemeColor(),
            gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName!,
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
                  '${weatherData!.temp.toInt()}',
                  style:
                  const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('max temp: ${weatherData!.maxTemp.toInt()}'),
                    Text('min temp: ${weatherData!.minTemp.toInt()}')
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
    );
  }
}
