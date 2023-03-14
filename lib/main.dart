import 'package:donation40/componants/custom_button.dart';
import 'package:donation40/helpers/cache_helper.dart';
import 'package:donation40/screens/auth_screen/signin.dart';
import 'package:donation40/screens/home/home.dart';
import 'package:donation40/screens/map_screen/map_screen.dart';
import 'package:donation40/screens/splash_screen.dart';
import 'package:donation40/screens/test_fire_base_screen/tset_fire_base_svreen.dart';
import 'package:donation40/test/test_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';//

import 'const/style.dart'; //flutter sdk

Future<void> main() async {//
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //
  await CacheHelper.init();
  runApp(  MyApp()); //fun  (myApp)
}

//MVVM
//MVC
//nav ,localization ,rout,res,
//

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return  MediaQuery(data: const MediaQueryData() ,
         child: ScreenUtilInit(//70.w
             designSize: const Size(428,925),//
             builder: (BuildContext ,Widget)=>
               GetMaterialApp( //root
                // home: TestScreen(),
                // home: SignInScreen(),
                home: TestFirebaseScreen(),

             )
         ));
  }

}
