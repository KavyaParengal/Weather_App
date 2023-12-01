
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/utilities/images_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget getWeatherIcon(int code, double width) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'images/1.png',
          width: width
        );
      case >= 300 && < 400:
        return Image.asset(
          'images/2.png',
          width: width
        );
      case >= 500 && < 600:
        return Image.asset(
          'images/3.png',
          width: width
        );
      case >= 600 && < 700:
        return Image.asset(
          'images/4.png',
          width: width
        );
      case >= 700 && < 800:
        return Image.asset(
          'images/5.png',
          width: width
        );
      case == 800:
        return Image.asset(
          'images/6.png',
          width: width,
        );
      case > 800 && <= 804:
        return Image.asset(
          'images/7.png',
          width: width,
        );
      default :
        return Image.asset(
          'images/7.png',
          width: width,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageRoute.background),
              fit: BoxFit.fill
          )
        ),
        child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
          builder: (context, state){
            if (state is WeatherBlocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is WeatherBlocSuccess) {
              final List<Weather> weatherForecast = state.weatherForecast;
              //print('---------------$weatherForecast');
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: primary
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Today',style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: white
                                    ),),
                                    IconButton(
                                        onPressed: (){

                                        },
                                        icon: Icon(Icons.keyboard_arrow_down,size: 28,color: white)
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    getWeatherIcon(weatherForecast[0].weatherConditionCode!,MediaQuery.of(context).size.width*0.22),
                                    Gap(15),
                                    Text('${weatherForecast[0].temperature!.celsius!.round()}°',style: TextStyle(
                                        fontSize: 55,
                                        fontWeight: FontWeight.bold,
                                        color: white
                                    ),),
                                  ],
                                ),
                                Text('${weatherForecast[0].weatherMain!}',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: white
                                ),),
                                Text('${weatherForecast[0].areaName}, ${weatherForecast[0].country}',style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: white
                                ),),
                                Text('${DateFormat('dd MMM yyyy').format(weatherForecast[0].date!)}',style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: white
                                ),),
                                Text('Feels like ${weatherForecast[0].tempFeelsLike!.celsius!.round()} | '
                                    'Sunset ${DateFormat().add_Hm().format(weatherForecast[0].date!)}',style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: white
                                ),)
                              ],
                            ),
                          )
                      ),
                      Gap(22),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: primary
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                ),
                                itemBuilder: (context, index){
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('${DateFormat().add_j().format(weatherForecast[index].date!)}',style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: white
                                      ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          getWeatherIcon(weatherForecast[index].weatherConditionCode!,MediaQuery.of(context).size.width*0.05),
                                          Gap(3),
                                          Text('${weatherForecast[index].temperature!.celsius!.round()}°',style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: white
                                          ),),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                itemCount: 10,
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Random Text',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: white
                                ),),
                                Text('Improve him believe opinion offered met and end cheered forbade. Friendly as stronger speedily by recurred. Son interest wandered sir addition end say. Manners beloved affixed picture men ask.',style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: white
                                ),),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              );
            } else if (state is WeatherBlocFailure) {
              return Center(
                child: Text('Failed to fetch weather data.'),
              );
            } else{
              return Container();
            }
          },
        )
      ),
    );
  }
}
