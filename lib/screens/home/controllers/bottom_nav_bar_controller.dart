
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNavBarController extends GetxController  {
  final currentIndex = 1.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

   changeTabIndex(int index) {
     currentIndex.value = index;
     update();
   }


}
