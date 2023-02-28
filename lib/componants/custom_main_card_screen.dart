import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/style.dart';
import '../screens/home/controllers/bottom_nav_bar_controller.dart';

class CustomMainScreenCard extends StatelessWidget {
  final String  label;
  final VoidCallback  onTap;
  const CustomMainScreenCard({
    Key? key,
    required this.label,
    required this.onTap,
   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Card(
        color: K.primaryColor,
        borderOnForeground: true,
        elevation: 3,
        shadowColor: K.primaryColor.withOpacity(.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          width: Get.width/1.3.w,
          // height: 170.w,
          padding: EdgeInsets.all( 5.sp),
          margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
          child: Column(
            children: [

              FittedBox(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.white),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}