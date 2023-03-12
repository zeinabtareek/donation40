import 'dart:io';

import 'package:donation40/screens/home/home.dart';
import 'package:donation40/screens/map_screen/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../componants/custom_button.dart';
import '../../componants/snackbar.dart';
import '../../const/style.dart';
import 'controller/add_item_controller.dart';

class AddItemScreen extends StatefulWidget {
  String? areaNumber;
  String? restAddress;
  String? lat;
  String ?apartmentNumber;
  String ?lng;
  String ?address;
    AddItemScreen({Key? key, this.areaNumber,this.address,this.lat,this.lng,this.apartmentNumber,this.restAddress}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  // final itemCountController = TextEditingController();
  // var date;
  // var time;
  // final dateTime = DateTime.now();
  // final timeOfDay = TimeOfDay.now();
  // File? image;
  // String ?dateID ;
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(AddItemController());


    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                  margin: EdgeInsets.all(10),
                  // padding: EdgeInsets.all(5),

                  decoration: K.boxDecoration,
                  height: 300,
                  child: controller.image1.value.isNotEmpty
                      ? Image.file(
                    File(controller.image1.value.toString()),
                    fit: BoxFit.contain,
                  )  : Image.asset(
              'assets/images/addimage.png',
            ),
                ),
                onTap: () {
                  controller.pickImage();//

                },
              ),
              K.sizedBoxH,
              Container(
                // decoration: K.boxDecoration,
                // margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: controller.itemCountController,
                  decoration: InputDecoration(
                    hintText: ' Item count',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: K.primaryColor)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black12)),
                  ),
                ),
              ),
              K.sizedBoxH,
              Container(
                // margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),

                decoration: K.boxDecoration,
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(MapScreen());
                      },
                      icon: Icon(Icons.add_location),
                    ),
                    Text(
                      'addreess',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              K.sizedBoxH,
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                        () => Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Delivery Date'.tr),
                            Container(
                              height: 60.h,
                              width: 150.w,
                              margin: EdgeInsets.only(left: 10.w, right: 10.w,bottom: 10.h,top: 10.h),
                              padding: EdgeInsets.all(2.sp),
                              decoration: K.boxDecoration,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final date = await controller.showCalender(
                                      context: context);
                                  if (date == null) return;
                                  controller.newTime.value = date;
                                  print(controller.dateTime.value);

                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                ),
                                child: controller.newTime.value == null
                                    ? Image.asset('assets/images/calender.png',fit: BoxFit.contain,width: 30.w,
                                    height: 30.h, color: K.mainColor)
                                    : Text(
                                  "${controller.newTime.value?.year}/${controller.newTime.value?.month}/${controller.newTime.value?.day}",
                                  style: TextStyle(color: K.blackColor),
                                ),
                              ),
                            ),
                          ],)
                    ),
                  ),
                  K.sizedBoxW,
                  Obx(
                        () => Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text('${'delivery_time'.tr}',style: TextStyle(color:Colors.black ),),
                          Text('${'Delivery Time'.tr} (${'24H'.tr})',style: TextStyle(color:Colors.black ),),
                          Container(
                            height: 60.h,
                            width: 150.w,
                            margin: EdgeInsets.only(left: 10.w, right: 10.w,bottom: 10.h,top: 10.h),
                            padding: EdgeInsets.all(2),
                            decoration: K.boxDecoration,
                            child: Theme(
                              data: ThemeData(
                                  primarySwatch: Colors.red,
                                  splashColor: Colors.green),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final timeSelected =
                                  await controller.showTime(context: context);
                                  if (timeSelected == null) return;
                                  controller.newTimeByHours.value = timeSelected;
                                  print(controller.time.value);
                                  controller.timePmOrAm=  DateFormat.jm().format( controller.dateTime.value);
                                  print('${controller.timePmOrAm} ,,,,,,,,,,,');
                                  print('${controller.timePmOrAm.runtimeType} ,,,,,,,,,,,');

                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                                ),
                                child: controller.newTimeByHours.value == null
                                    ? Image.asset('assets/images/alerm.png',fit: BoxFit.contain,width: 30.w,
                                    height: 30.h, color: K.mainColor)
                                    : Text(
                                  // "${controller.timePmOrAm}",
                                  "${controller.newTimeByHours.value?.hour}:${controller.newTimeByHours.value?.minute} ",
                                  style: TextStyle(color: K.blackColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),              K.sizedBoxH,
              K.sizedBoxH,
              Obx(()=>Center(

                child: Button(
                  width: MediaQuery.of(context).size.width / 2,
                  height: Get.height / 20.h,
                  onPressed: () {
                    controller.addItemToFirebase(widget.apartmentNumber,widget.lat,widget.lng,widget.areaNumber.toString(),widget.address,widget.restAddress).then((v){
                      showSnackBar(context,'one item added successfully ');

                      Get.off(Home());
                    });
                    // controller.addItemToFirebase(widget.restAddress);
                  },
                  text: controller.isLoading.value==true?'loading ....':'Submit',
                  isFramed: false,
                ),
              )
              )
            ],
          ),
        ),
      )),
    );
  }


}
