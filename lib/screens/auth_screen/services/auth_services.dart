
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home.dart';
import '../otp.dart';

class AuthServices {
  //
  final auth = FirebaseAuth.instance; //1- enable,2-package
  final store = FirebaseFirestore.instance; //


  signIn(email, pass) async {
    //signIn
    await auth.signInWithEmailAndPassword(email: email, password: pass);
    //dataBase(map , map)

  }

// signUp(email,pass)async{
//
//  await auth.createUserWithEmailAndPassword(email: email, password: pass)//
//       .then((value){
//     if(value !=null){
//       store.collection('users').doc(value.user!.uid).set({
//         'deviceToken':'test',
//         'id':'test',
//         'name':'$email',
//         'phone':'test',
//         'password':'$pass',
//       });
//       // store.collection('users').doc(auth.currentUser!.uid).
//
//     }
//
//   });
//
// }
  signOut() async {
    await auth.signOut();
  }
}