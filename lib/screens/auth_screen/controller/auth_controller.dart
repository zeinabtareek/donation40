import 'package:donation40/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final services = AuthServices();
  final formKey=GlobalKey<FormState>();
  String email ='';
  String password ='';

  // register()async { //createUser
  //   UserCredential  v=await services.auth.createUserWithEmailAndPassword(email: email, password: password);
  //  }
  //
  //  register1(email,pass)async { //createUser
  //   UserCredential  v=await services.auth.createUserWithEmailAndPassword(email: email, password: pass);
  //  }
  //
  // login(email,password)async { //createUser
  //   UserCredential  v= await services.auth.signInWithEmailAndPassword(email: email, password: password);
  // }
  //
  // logOut() {
  //
  // }
  //
  // forgetPassword() {}

register(email,password)async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
}
logIn(email , password)async{
  await  services.auth.signInWithEmailAndPassword(email: email, password: password);
   // services.auth.signOut();
}
  // registerWithPhone()async{
  //   await FirebaseAuth.instance.signInWithCredential(credential)
  // }
//splash - init (credential ) home

}
// 5(CRUD)
