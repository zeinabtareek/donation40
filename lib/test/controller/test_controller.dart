
import 'package:get/get.dart';

class TestController extends GetxController{//controller =>test
  //UI-controller
  int counter =0; //
  final counter2 =0.obs; //

  String name='';//GetBuilder
  final name1=''.obs;//Obx ,Getx
onInit(){
  super.onInit();
  print('hello');

  //getFun()
}
  increment(){
    counter ++;
    update();//GetBuilder
  }
  getName(){
  return name1.value;//obx //Getx
  }


  increment2(){
    counter2.value ++;
   }
}

