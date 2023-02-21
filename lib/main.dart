import 'package:donation40/componants/custom_button.dart';
import 'package:donation40/screens/map_screen/map_screen.dart';
import 'package:donation40/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'const/style.dart'; //flutter sdk

void main() {
  runApp(  MyApp()); //fun  (myApp)
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return  MediaQuery(data: const MediaQueryData() ,
         child: ScreenUtilInit(//70
             designSize: const Size(428,925),//
             builder: (BuildContext ,Widget)=>const MaterialApp(
               home: MapSample(),
               // home: SplashScreen(),
             )));
  }
  // Scaffold :body , appbar , floatActionButton , drawer , bottomNav Bar

}




