import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/custom_button.dart';
import '../../componants/pin_text_field.dart';
import 'controller/auth_controller.dart';

class OTPScreen extends StatelessWidget {
    OTPScreen({Key? key, required this.verificationId,required this.name,required this.phone})  : super(key: key);
  String verificationId;
  String name;
  String phone;
 final controller =Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  "assets/images/check-mark.png",
                  width: 180.w,
                  height: 180.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: PinCodeField(
                    textEditingController:controller.pinNumber,
                  ),
                ),
                Button(
                    isFramed: false,
                    height: Get.height / 20.h,

                    text: " تاكيد المسخدم".tr,
                    onPressed: () async {
                      controller.verifyCode(verificationId, controller.pinNumber.text, 'mohamed');

                    }, width: 200,),
                Button(
                    isFramed: true,
                    height: Get.height / 20.h,
                     text: "اعاده ارسال ".tr,
                    onPressed: () async {

                    }, width: 200,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
