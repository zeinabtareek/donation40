 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';

class AuthController extends GetxController { //domain layer
  final services = AuthServices();
  final formKey=GlobalKey<FormState>();
  String signInEmail ='';
  String signUpPassword ='';
  String signUnEmail ='';
  String signInPassword ='';




register()async{//dart- isolate

 await services.auth.createUserWithEmailAndPassword(email: signInEmail, password: signInPassword);
// return
}
logIn(email,pass)async{
 await services.auth.signInWithEmailAndPassword(email: signUnEmail, password: signUpPassword);
}
logOut(){

}

}
// 5(CRUD)
