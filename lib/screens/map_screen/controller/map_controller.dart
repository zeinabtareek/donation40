import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController{

  String areaNumber='';
  TextEditingController restAddress=TextEditingController();
  TextEditingController apartmentNumber=TextEditingController();

  LatLng  currentLocation=LatLng(0.0, 0.0);
}