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
import 'controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  TextEditingController areaNumber=TextEditingController();
  TextEditingController restAddress=TextEditingController();
  TextEditingController apartmentNumber=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [  Container(
                padding: EdgeInsets.all(5.sp),
                decoration:K.boxDecoration,
                width: double.infinity,
                height: 500.h,
                child: GoogleMap(
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
                          myLocationButtonEnabled: true,
                          zoomGesturesEnabled: true,
                           mapToolbarEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(37.43296265331129, -122.08832357078792),
                              zoom: 15),
                           onMapCreated: (GoogleMapController
                          gcontroller) async {    },
                          onTap: (LatLng loc) {
                            print(
                                '${loc.latitude}, ${loc.longitude}');

                          },
                        ),
                        ),

              Row(
              children: [
                Expanded(child:
                Container(
                  margin: EdgeInsets.all(10.sp),

                  child:CustomAddressTextField(
                    textEditingController: areaNumber,
                    hintText: "رقم المنطقة",
                    labelText: "رقم المنطقة",
                  ),),),
                Expanded(child:
                Container(
                  margin: EdgeInsets.all(10.sp),

                  child:CustomAddressTextField(
                    textEditingController: apartmentNumber,
                    hintText: "رقم الشقة",
                    labelText: "رقم الشقة",
                  ),),),

              ],
            ),

            Expanded(child:
            Container(
              margin: EdgeInsets.all(10.sp),
              child:CustomAddressTextField(
                textEditingController: restAddress,
                hintText: "علامة مميزة ",
                labelText: " علامة مميزة",
              ),),),

            Button(text: 'تأكيد العنوان', width: 200, height: 50, isFramed: false,
              onPressed: (){},)
          ],
        ),
      ),
    );
  }
}
