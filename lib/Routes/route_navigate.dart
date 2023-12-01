import 'package:flutter/material.dart';
import 'package:weather_app/Routes/route_name.dart';

import '../Screens/home_page.dart';
import '../Screens/splash_screen.dart';

class RouteNavigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());

      default:
        return MaterialPageRoute(builder: (context)=> const HomePage());
    }
  }
}