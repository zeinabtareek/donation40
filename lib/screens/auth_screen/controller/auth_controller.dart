 import 'package:donation40/helpers/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/home.dart';
import '../otp.dart';
import '../services/auth_services.dart';

class AuthController extends GetxController { //domain layer
  final services = AuthServices();
  final formKey=GlobalKey<FormState>();
  String signInEmail ='';
  String signUpPassword ='';
  String signUnEmail ='';
  String signInPassword ='';
  TextEditingController pinNumber=TextEditingController();




register()async{//dart- isolate

 var user =await services.auth.createUserWithEmailAndPassword(email: signInEmail, password: signInPassword).then((value) async {
   await CacheHelper.saveData(key: 'token', value: value.user!.uid);
 // user.credential.token
 // services.auth.currentUser.uid;
 });
// return
}
logIn(email,pass)async{
 var user=await services.auth.signInWithEmailAndPassword(email: signUnEmail, password: signUpPassword);
 await CacheHelper.saveData(key: 'token', value:  user.user!.uid);


}
logOut(){

}

  /// auth phone number
  sendVerificationCode({phone })async{
    await services.auth.verifyPhoneNumber(
      phoneNumber: '${phone}',//??''
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
        ///
        await services.auth.signInWithCredential(phoneAuthCredential).then((value){
          if(value.user !=null){
            print('user verified');
          }
          else{
            print('%%%%%%%%%%%%%%%% failed');
          }
        });

      },
      verificationFailed: (FirebaseAuthException e){

        Get.defaultDialog(content: Text('${e.code}'),title: 'nointernet');
      },
      codeSent: (String verificationId,int ?resendToken ){
        Get.to(OTPScreen(verificationId:verificationId,  name: '', phone: '',));
      },
      codeAutoRetrievalTimeout: (String verificationId){

      },
      timeout: Duration(minutes: 1),
    );
  }


  ///second fun verify code
  verifyCode(verificationId,smsCode,email)async {
    //phone => credential
    PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode);
    await services.auth.signInWithCredential(credential).then((value) {
      if(value !=null) {
        services.store.collection('users').doc(value.user!.uid).set({
          'deviceToken': 'test',
          'id': 'test',
          'name': '$email',
          'phone': 'test',
        });
        Get.offAll(Home());
      }
    });
  }





}


// 5(CRUD)
