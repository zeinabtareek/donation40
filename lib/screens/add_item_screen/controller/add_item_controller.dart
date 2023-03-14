//


import 'dart:io';

import 'package:donation40/model/item_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/style.dart';
import '../services/add_item_services.dart';

class AddItemController extends GetxController{
 final services=AddItemServices();
 final itemCountController = TextEditingController();
 Rx<DateTime> dateTime = DateTime.now().obs;
 Rxn<DateTime> newTime = Rxn<DateTime>();
 Rxn<TimeOfDay> newTimeByHours = Rxn<TimeOfDay>();
 Rx<TimeOfDay> time = TimeOfDay.now().obs;
  String timePmOrAm='';
 String ?dateID ;
 final image1 = ''.obs;
 final    isLoading= false.obs;

 ///**************************** **************************** add item to firebase fire store ****************************  ****************************
 addItemToFirebase(apartmentNumber,lat,lng,areaNumber,address,landMark)async{


   isLoading.value=true;

   var x='${newTime.value?.year}.${ newTime.value?.month}.${ newTime.value?.day}';
   var y='${newTimeByHours.value!.hour}:${newTimeByHours.value?.minute}';   await services.addItemToFirebase(
       ItemModel(
           date: x,
           time: y ,
         apartmentNumber:apartmentNumber,
          lng :lng,
           lat:lat,
           status: 'Success',
           imageUrl: await uploadImageToFirebaseStorage(image1.value,image1.value),
           areaNumber:areaNumber, //pointer 5
           address:address,
           landMark:landMark,
           pieces :itemCountController.text,
           userToken:services.authSer.auth.currentUser!.uid
       ), x);
   isLoading.value=false;

 }

 ///**************************** **************************** add item to realTime database  **************************** ****************************


 addItemToRealTimeDatabase(apartmentNumber,lat,lng,areaNumber,address,landMark)async{
   isLoading.value=true;
   var y='${newTimeByHours.value!.hour}:${newTimeByHours.value?.minute}';
   var x='${newTime.value?.year}.${ newTime.value?.month}.${ newTime.value?.day}';
   await services.addItemToRealTimeDatabase(
       ItemModel(
           date: x,
           time: y ,
           apartmentNumber:apartmentNumber,
           lng :lng,
           lat:lat,
           status: 'Success',
           imageUrl: await uploadImageToFirebaseStorage(image1.value,image1.value),
           areaNumber:areaNumber, //pointer 5
           address:address,
           landMark:landMark,
           pieces :itemCountController.text,
           userToken:services.authSer.auth.currentUser!.uid
   ), time).then((v){
     return Get.snackbar('done', 'one item is added',backgroundColor: Colors.white24,
       duration: Duration(seconds: 3)
     );

   });

   isLoading.value=false;

 }





 final _picker = ImagePicker();

 pickImage() async {
   try {
     final XFile? image =
     await _picker.pickImage(source: ImageSource.gallery);

     if (image != null) image1.value = image.path;
   } catch (e) {
     print(e.toString());
   }
 }
 Future<DateTime?> showCalender({required BuildContext context}) async =>
     await showDatePicker(
         context: context,
         initialDate: dateTime.value,
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
         initialTime:  time.value,
         builder: (BuildContext context, Widget? child) {
           return Theme(
               data: ThemeData.light().copyWith(
                   primaryColor: Colors.yellow,
                    accentColor: Colors.red,
                   colorScheme: ColorScheme.light(primary: K.primaryColor)),
               child: child!);
         });
 //

Future <String>uploadImageToFirebaseStorage(String imagePath,imageName)async{
  // services.cloud.collection('users').doc('id').

  final ref=await services.storage.ref().child('Product_image/$imageName');
 final uploadedImage= ref.putFile(File(imagePath));
  final imageURL= (await (await uploadedImage).ref.getDownloadURL()).toString();
  return imageURL;

 }

}