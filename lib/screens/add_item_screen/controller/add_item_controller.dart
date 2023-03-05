//


import 'dart:io';

import 'package:donation40/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/style.dart';
import '../services/add_item_services.dart';

class AddItemController extends GetxController{
 final services=AddItemServices();
 final itemCountController = TextEditingController();
 var date;
 var time;
 final dateTime = DateTime.now();
 final timeOfDay = TimeOfDay.now();
 File? image;
 String ?dateID ;

 addItemToFirebase(apartmentNumber,lat,lng,areaNumber,address,landMark)async{
   var x='${dateTime.year}.${dateTime.month}.${dateTime.day}';
   await services.addItemToFirebase(
       ItemModel(
         date: x,
         time: '${timeOfDay.hour} ${timeOfDay.minute}',
         apartmentNumber:apartmentNumber,
          lng :lng,
           lat:lat,
           status: 'Success',
           imageUrl:'',
           areaNumber:areaNumber, //pointer 5
           address:address,
           landMark:landMark,
           pieces :itemCountController.text,
           userToken:services.authSer.auth.currentUser!.uid
       ), x);
 }
 pickImage() async {
   //class ImagePicker ( obj) , (class )
   final pickedImage =
   await ImagePicker().pickImage(source: ImageSource.gallery);
   // setState(() {
     image = File(pickedImage!.path);
     update();
   // });
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
                    accentColor: Colors.red,
                   colorScheme: ColorScheme.light(primary: K.primaryColor)),
               child: child!);
         });



}