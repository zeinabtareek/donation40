import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../componants/delete_dialog.dart';
import '../../../model/item_model.dart';
import '../../../model/user.dart';
import '../services/history_services.dart';

class HistoryController extends GetxController {
  final services = HistoryServices();
  UserModel userModel=UserModel();

  @override
  onInit() async {
    getUser();
    getProducts();
  }


  getUser() async {//Future ,UserModel
    await services.getUserDataFirebaseFirestore().then((UserModel userModel2){
      print(userModel2);
      userModel=userModel2;
    });
    update();
  }
  getProducts() {//Stream ,
    print(services.getUerProducts());
    return HistoryServices().getUerProducts();
  }

  getProductsFromRealTimeDatabase()async{
    return HistoryServices().getProductsFromRealTimeDatabase();
  }


  deleteItem(id)async {
    await services.deleteItem(id);
  }


}
