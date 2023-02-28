import 'package:donation40/componants/custom_button.dart';
import 'package:donation40/screens/auth_screen/signin.dart';
import 'package:donation40/screens/map_screen/map_screen.dart';
import 'package:donation40/screens/splash_screen.dart';
import 'package:donation40/test/test_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';//

import 'const/style.dart'; //flutter sdk

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  MyApp()); //fun  (myApp)
}

//MVVM
//MVC

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return  MediaQuery(data: const MediaQueryData() ,
         child: ScreenUtilInit(//70
             designSize: const Size(428,925),//
             builder: (BuildContext ,Widget)=>
             GetMaterialApp( //rout
                // home: TestScreen(),
                home: SignInScreen(),
                // home: SplashScreen(),

             )
         ));
  }

}
// link firebase & app (2 steps)

//to use firebase products ( 3 steps)
//1- enable product
//2- package
//3- instance
// action -event {bloc ,cubit ,GetxController }-state -Update =Notify listener
// getx => //statemanagement , de-in,local(translation),routes , local(shared pref)
//routes, de-in

