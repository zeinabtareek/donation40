import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/style.dart';


class CustomAddressTextField extends StatelessWidget {
   CustomAddressTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
      this.onChanged,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        cursorColor: K.primaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged:onChanged ,
        decoration:InputDecoration(
          hintText: hintText.toString().tr,
          label: Text(labelText.tr,),
          labelStyle: TextStyle(color: K.mainColor,fontSize: 16.sp),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.all(13.w),
          hintStyle: TextStyle(color: K.mainColor,fontSize: 18,fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: K.mainColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: K.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: K.mainColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),)
    );
  }

}
