import 'package:donation40/screens/auth_screen/services/auth_services.dart';
import 'package:donation40/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../componants/custom_address_textField.dart';
import '../../componants/snackbar.dart';
import 'controller/auth_controller.dart';

class SignInScreen extends StatelessWidget {
    SignInScreen({Key? key}) : super(key: key);
   final controller=Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.all(10),

              child:CustomAddressTextField(
                textEditingController:  TextEditingController(),
                hintText: " email ",
                labelText: "email",
                onChanged: (data){
                  controller.signInEmail=data;
                  print(controller.signInEmail);


                },
              ),),

              Container(
              margin: EdgeInsets.all(10),
              child:CustomAddressTextField(
                textEditingController:  TextEditingController(),
                hintText: " password ",
                labelText: "password",
                onChanged: (data){
                  controller.signInPassword=data;
                  print(controller.signInPassword);

                },
              ),),
            TextButton(onPressed: () async {
               if(controller.formKey.currentState!.validate()){
                try {
                 // await  controller.logIn(controller.signInEmail,controller.signInPassword);
                 await  controller.register();
                  showSnackBar(context,'Email Success');
                  Get.to(HomeScreen());
                }on FirebaseAuthException catch(e){
                  showSnackBar(context,'${e.message}');
              }
              }
              else{
                print('object');
              }

             // await controller.sendVerificationCode(phone: '+201009814536');


            }, child: Text('Sign Up'),)
          ],
        ) ,
      )
    );
  }
}



// class Test extends GetxController{}
