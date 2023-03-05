import 'dart:io';

import 'package:donation40/screens/map_screen/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../componants/custom_button.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                // padding: EdgeInsets.all(5),

                decoration: K.boxDecoration,
                height: 300,
                child: controller.image == null
                    ? Image.asset(
                        'assets/images/no.jpeg',
                        fit: BoxFit.fill,
                      )
                    : Image.file(controller.image!),
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
              children: [
                Expanded(
                    child: Container(
                        height: 60,
                        decoration: K.boxDecoration,
                        child: ElevatedButton(
                          onPressed: () async{

                            await controller.showTime(context: context);
                            if (controller.timeOfDay == null) return; //break
                            setState(() {
                              controller.date = controller.timeOfDay;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: controller.date != null
                              ? Text('${controller.date.hour}',style: TextStyle(color: K.blackColor),)
                              : Image.asset(
                                  // 'assets/images/snap.png',
                                  'assets/images/alerm.png',
                                  height: 30.h,
                                ),
                        ))),
                K.sizedBoxW,
                Expanded(
                    child: Container(
                        height: 60,
                        decoration: K.boxDecoration,
                        child: ElevatedButton(
                          onPressed: () async {
                            DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");//
                            await controller.showCalender(context: context);
                            if (controller.dateTime == null) return; //break
                            setState(() {
                              controller.time = controller.dateTime;
                              controller.dateID = dateFormat.format(controller.time);
                            });
                            //

                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: controller.time != null
                              ? Text(
                                  '${controller.dateID}',
                                  // '${time.year}/${time.month}/${time.day}',
                                  style: const TextStyle(color: K.blackColor),
                                )
                              : Image.asset(
                                  'assets/images/calender.png',
                                  height: 40.h,
                                ),
                        ))),
              ],
            ),
            K.sizedBoxH,
            K.sizedBoxH,
            Center(
              child: Button(
                width: MediaQuery.of(context).size.width / 2,
                height: Get.height / 20.h,
                onPressed: () {
                  controller.addItemToFirebase(widget.apartmentNumber,widget.lat,widget.lng,widget.areaNumber.toString(),widget.address,widget.restAddress);
                  // controller.addItemToFirebase(widget.restAddress);
                },
                text: 'Submit',
                isFramed: false,
              ),
            )
          ],
        ),
      )),
    );
  }


}
