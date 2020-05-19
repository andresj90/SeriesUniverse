import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import './screens/home/index.dart';
import './screens/series_detail/index.dart';


class Routes {
  final routes = <String, WidgetBuilder> {
     
    // '/': (BuildContext context) => SerieDetail()
  }; 

  Routes() {
    runApp(new MaterialApp(
      // theme: ThemeData.,
      title: 'Series Universe',
      initialRoute: '/',
       routes: routes,
       home: SplashScreen(
         'assets/images/SplashIntro.flr',
          Home(), 
          startAnimation: 'intro',
          backgroundColor: Color(0xff5f4339), 
          isLoading: true,
          
         ),
    )); 
  }
}