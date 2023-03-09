 //class extends statelesswidget
 //class
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation40/model/ads_model.dart';
import 'package:get/get.dart';

import '../services/home_services.dart';

class HomeScreenController extends GetxController{ //logic
final services=HomeScreenServices();
int currentImageIndex = 0;
@override
  void onInit() {
    // TODO: implement onInit


  getAds();
    super.onInit();
  }
List homeSliderAds=<AdsModel>[].obs;
//homeSliderAds[0]

List x=[];

 getAds(){
   services.getAds().then((value){
     value.docs.forEach((element){
       homeSliderAds.add(AdsModel.fromson(element));
     });
print(value);
   });
 }





 change(index){
   currentImageIndex = index;
 }
}
