import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../componants/custom_button.dart';
import '../../const/style.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final itemCountController = TextEditingController();
  var date;
  var time;
  final dateTime = DateTime.now();
  final timeOfDay = TimeOfDay.now();
  File? image;
  String ?dateID ;
  @override
  Widget build(BuildContext context) {
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
                child: image == null
                    ? Image.asset(
                        'assets/images/no.jpeg',
                        fit: BoxFit.fill,
                      )
                    : Image.file(image!),
              ),
              onTap: () {
                pickImage();//

              },
            ),
            K.sizedBoxH,
            Container(
              // decoration: K.boxDecoration,
              // margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: itemCountController,
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
                    onPressed: () {},
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

                            await showTime(context: context);
                            if (timeOfDay == null) return; //break
                            setState(() {
                              date = timeOfDay;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: date != null
                              ? Text('${date.hour}',style: TextStyle(color: K.blackColor),)
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
                            await showCalender(context: context);
                            if (dateTime == null) return; //break
                            setState(() {
                              time = dateTime;
                              dateID = dateFormat.format(time);
                            });
                            //

                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: time != null
                              ? Text(
                                  '${dateID}',
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
            ///Expanded
            // K.sizedBoxH,
            // Row(children: [
            //   // Container(child: Text('Ahmed'),color: Colors.cyan,),
            //   Expanded( ///2 //flexible///spacer
            //     // flex: 3,
            //       child: Container(child: Text('Ahmed'),color: Colors.cyan,)), //
            //
            // Container( width: 100,///1
            //   child:Text('Zeinab'),color: Colors.red,),
            //
            // ],),
            // K.sizedBoxH,
            K.sizedBoxH,
            Center(
              child: Button(
                width: MediaQuery.of(context).size.width / 2,
                height: Get.height / 20.h,
                onPressed: () {},
                text: 'Submit',
                isFramed: false,
              ),
            )
          ],
        ),
      )),
    );
  }

  pickImage() async {
    //class ImagePicker ( obj) , (class )
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  Future<DateTime?> showCalender({required BuildContext context}) async =>
      await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: ThemeData.light().copyWith(
                    primaryColor: K.primaryColor,
                    colorScheme: ColorScheme.light(primary: K.primaryColor)),
                child: child!);
          });

  Future<TimeOfDay?> showTime({required BuildContext context}) async =>
      await showTimePicker(//Flutter SDK
          context: context,
          initialTime: timeOfDay,
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: ThemeData.light().copyWith(
                    primaryColor: Colors.yellow,
                    // primaryColor: K.primaryColor,
                    accentColor: Colors.red,
                    colorScheme: ColorScheme.light(primary: K.primaryColor)),
                child: child!);
          });
}
