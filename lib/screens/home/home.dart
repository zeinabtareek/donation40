import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/style.dart';
import '../../helpers/connectivity.dart';
import '../history_screen/history_screen.dart';
import '../home_screen/home_screen.dart';
import '../more_info_screen/more_info_screen.dart';
import 'controllers/bottom_nav_bar_controller.dart';
import 'package:show_up_animation/show_up_animation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
// final bottomNavBarController=Get.put(BottomNavBarController());
final connection = Get.put(ConnectionStatusSingleton());
final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

//
// changeTabIndex(int index) {
//   currentIndex  = index;
// }
final List bodyScreens = [

  MoreInfoScreen(),
  HomeScreen(),
   HistoryScreen(),
    ].obs;
final List bodyTitle = [

  "تواصل معنا",
  'الرئيسيه',
  "تتبع الطلب",

    ].obs;

    return  Scaffold(
        backgroundColor: Colors.white,
        key:  scaffoldKey,
        // appBar:ArrowsAppBar( bodyTitle.elementAt(bottomNavBarController.currentIndex.value)),
        body:
        // Obx(() => connection.connectivity.value == 1
        //     ?
        SafeArea(child:  bodyScreens.elementAt( currentIndex)),
        //     :
        // Scaffold(
        //     body: Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Image.asset(
        //               'assets/icons/ic_no_connection.png',
        //               height: 300.h,
        //               width: 300.w,
        //               color: K.mainColor,
        //             ),
        //             Text(
        //               'no_connection'.tr,
        //               style: TextStyle(
        //                   fontSize: 25.sp,
        //                   color: K.primaryColor,
        //                   fontWeight: FontWeight.bold),
        //             ),
        //           ],
        //         )))
    // ),
        bottomNavigationBar:
        Material(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.only(bottom: 5.h),
            margin: EdgeInsets.only(bottom: 10.h),
            width: double.infinity,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                       // changeTabIndex(0);
                       currentIndex  = 0;

                      });

                    },
                    child: Container(
                      width: 80.w,
                      padding: EdgeInsets.only(top: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: currentIndex == 0
                            ?K.primaryColor
                            : Colors.transparent,
                      ),
                      child: Column(
                        children: [ currentIndex == 0
                              ? ShowUpAnimation(
                              animationDuration:
                              const Duration(milliseconds: 200),
                              child: Image.asset(
                                "assets/icons/support.png",
                                width: 50.w,
                                height: 35.h,
                                color: currentIndex ==
                                    0
                                    ? Colors.white
                                    : Colors.black,
                              ))
                              : Image.asset(
                            "assets/icons/support.png",
                            width: 50.w,
                            height: 35.h,
                            color:  currentIndex ==
                                0
                                ? Colors.white
                                : Colors.black,
                          ), currentIndex == 0
                              ? ShowUpAnimation(
                            animationDuration:
                            Duration(milliseconds: 200),
                            child: Text("تواصل معنا".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                    color:  currentIndex ==
                                        0
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16.sp)),
                          )
                              : const SizedBox()
                        ],
                      ),
                    ),

                )),

                  Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                      // changeTabIndex(1);
                currentIndex=1;
                      });
                    },
                    child: Container(
                      width: 80.w,
                      padding: EdgeInsets.only(top: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: currentIndex == 1
                            ?K.primaryColor
                            : Colors.transparent,
                      ),
                      child: Column(
                        children: [ currentIndex == 1
                              ? ShowUpAnimation(
                              animationDuration:
                              Duration(milliseconds: 200),
                              child: Image.asset(
                                "assets/icons/ic_home.png",
                                width: 50.w,
                                height: 35.h,
                                color:  currentIndex ==
                                    1
                                    ? Colors.white
                                    : Colors.black,
                              ))
                              : Image.asset(
                            "assets/icons/ic_home.png",
                            width: 50.w,
                            height: 35.h,
                            color: currentIndex ==
                                1
                                ? Colors.white
                                : Colors.black,
                          ), currentIndex == 1
                              ? ShowUpAnimation(
                              animationDuration:
                              Duration(milliseconds: 200),
                              child: Text("الرئيسيه".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,

                                      color: currentIndex ==
                                          1
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16.sp)))
                              : SizedBox()
                        ],
                      ),
                    ),

                )),
               Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // changeTabIndex(2);
                        currentIndex=2;;
                      });

                    },
                    child: Container(
                      width: 80.w,
                      padding: EdgeInsets.only(top: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: currentIndex == 2
                            ?K.primaryColor
                            : Colors.transparent,
                      ),
                      child: Column(
                        children: [
                          currentIndex == 2
                              ? ShowUpAnimation(
                              animationDuration:
                              Duration(milliseconds: 200),
                              child: Image.asset(
                                "assets/icons/track.png",
                                width: 50.w,
                                height: 35.h,
                                color: currentIndex ==
                                    2
                                    ? Colors.white
                                    : Colors.black,
                              ))
                              : Image.asset(
                            "assets/icons/track.png",
                            width: 50.w,
                            height: 35.h,
                            color:  currentIndex ==
                                2
                                ? Colors.white
                                : Colors.black,
                          ),
                          currentIndex == 2
                              ? Text("تتبع الطلب".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,

                                  color:  currentIndex ==
                                      2
                                      ? Colors.white
                                      : Colors.white,
                                  fontSize: 16.sp))
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        )

    );
  }
}
