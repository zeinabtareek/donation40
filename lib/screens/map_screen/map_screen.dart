 import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../componants/custom_address_textField.dart';
import '../../componants/custom_button.dart';
import '../../const/style.dart';
import '../add_item_screen/add_item_screen.dart';
import '../add_item_screen/controller/add_item_controller.dart';
import 'controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
final controller=Get.put(MapController());
final Completer<GoogleMapController> _controller =
Completer<GoogleMapController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [  Container(
                padding: EdgeInsets.all(5.sp),
                decoration:K.boxDecoration,
                width: double.infinity,
                height: 500.h,
                child: GetBuilder<MapController>(
                  init:MapController() ,
                      builder:(controller)=>GoogleMap(
                          gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(
                                    () => PanGestureRecognizer()))
                            ..add(Factory<ScaleGestureRecognizer>(
                                    () => ScaleGestureRecognizer()))
                            ..add(Factory<TapGestureRecognizer>(
                                    () => TapGestureRecognizer()))
                            ..add(Factory<
                                VerticalDragGestureRecognizer>(
                                    () =>
                                    VerticalDragGestureRecognizer())),
                          mapType: MapType.normal,
                          zoomControlsEnabled: true,
                          myLocationEnabled: true,
                          markers: controller.markers.toSet(),
                          myLocationButtonEnabled: true,
                          zoomGesturesEnabled: true,
                           mapToolbarEnabled: true,
                          initialCameraPosition: CameraPosition(  target:
                          // MapController.position1!,
                          LatLng(37.43296265331129, -122.08832357078792),
                              zoom: 15),
                           onMapCreated: (GoogleMapController  gcontroller) async {
                             _controller.complete(gcontroller);
                            controller.getCurrentLocation(context);
                           },
                          onTap: (LatLng loc) {
                            print(
                                '${loc.latitude}, ${loc.longitude}');
                            controller.currentLocation.latitude!=loc.latitude;
                            controller.currentLocation.longitude!=loc.longitude;
                            controller.addMarkerOnMap(loc);
                            controller.update();

                          },
                        ),
                        ),
                        ),

              Row(
              children: [
                Expanded(child:
                Container(
                  margin: EdgeInsets.all(10.sp),

                  child:CustomAddressTextField(
                    textEditingController: TextEditingController(),
                    hintText: "رقم المنطقة",
                    labelText: "رقم المنطقة",
                    onChanged: (c){
                      controller.areaNumber=c;
                    },
                  ),),),
                Expanded(child:
                Container(
                  margin: EdgeInsets.all(10.sp),

                  child:CustomAddressTextField(
                    textEditingController: controller.apartmentNumber,
                    hintText: "رقم الشقة",
                    labelText: "رقم الشقة",
                  ),),),

              ],
            ),

            Expanded(child:
            Container(
              margin: EdgeInsets.all(10.sp),
              child:CustomAddressTextField(
                textEditingController: controller.restAddress,
                hintText: "علامة مميزة ",
                labelText: " علامة مميزة",
              ),),),

            Button(text: 'تأكيد العنوان', width: 200, height: 50, isFramed: false,
              onPressed: (){
              Get.to(AddItemScreen(
                areaNumber:controller.areaNumber,
                restAddress:controller.restAddress.text,
                apartmentNumber:controller.apartmentNumber.text,
                lat:'controller.currentLocation.latitude.toString()',
                lng:'controller.currentLocation.longitude.toString()',
                address:'address.c..c,ckncbhbchbhc'
               ));
              // Get.off(AddItemScreen());
              // Get.offAll(AddItemScreen());
              // Get.back();
              // Get.toNamed(page);
              // Get.offNamed(page);
              // Get.offAllNamed(page);
              },)
          ],
        ),
      ),
    );
  }
}
