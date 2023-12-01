
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/images_route.dart';

import '../Routes/route_name.dart';
import '../utilities/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
            (value) => Navigator.popAndPushNamed(context, RouteName.homeScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageRoute.appIcon,
              height: 150,
              color: Colors.white,
            ),
            const SizedBox(height: 15,),
            Text('Weather App',style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            const SizedBox(height: 30,),
            const CircularProgressIndicator(
              color: white,
            )
          ],
        ),
      ),
    );
  }
}
