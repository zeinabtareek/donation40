import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/style.dart';
import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // print('Hello zeinab ');
    Timer(Duration(seconds: 5), () {
      //async //check ->login ,
      try {
        //if( await FirebaseAuth.instance.currentUser !=null) //
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        //else{
        //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()));

      } catch (e) {

        print(e);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300.h,
              width: 300.w,
              child: Image.asset('assets/images/logo.png'),
            ),
            K.sizedBoxH,
            K.sizedBoxH,
            Container(
              // padding: EdgeInsets.only(top: 20.h,right: 20.w),
              // padding:   EdgeInsets.all(20.sp),//fontSize
              // padding: EdgeInsets.all(value),
              // height: Get.height/4.h,

              width: MediaQuery.of(context).size.width - 100.w,
              // color: Colors.black26,
              child: RotatedBox(
                quarterTurns: 2,
                child: LinearProgressIndicator(
                  minHeight: 2.h,
                  color: Colors.white,
                  backgroundColor: K.mainColor.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
