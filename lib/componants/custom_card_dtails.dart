
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/style.dart';
import 'custom_image.dart';
class CustomCardDetails extends StatelessWidget {
  const CustomCardDetails(
      {Key? key,
      this.pieces,
      this.image,
      this.status,
      this.time,
      this.message,

      this.date,
      this.totalPrice})
      : super(key: key);

  final String? message;
  final String? image;
  final String? pieces;
  final String? status;
  final String? date;
  final String? time;
  final String? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: K.mainColor,
        borderRadius: BorderRadius.circular(5),

        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Spacer(),
                                  const Spacer(),
                                  Text(
                                    date!,
                                    style: TextStyle(
                                        color: K.mainColor,
                                        fontSize: 16.sp),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ": ${'date'.tr} ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: K.mainColor,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  const Spacer(),
                                  Text(
                                    pieces!,
                                    style: TextStyle(
                                        color: K.mainColor,
                                        fontSize: 16.sp),
                                  ),
                                  const Spacer(),
                                  Text(
                                    " : ${'the_number_of_pieces'.tr} ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: K.mainColor,
                              ), Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  const Spacer(),
                                  Text(status!,
                                    style: TextStyle(
                                        color: K.primaryColor,
                                        fontSize: 16.sp),
                                  ),
                                  const Spacer(),
                                  Text(
                                    " :  الحاله ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),



                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomImage(
                      image: image!,
                      height: Get.height /8,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      // height: Get.height *0.05,
                      decoration: const BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5))),
                      child: Center(
                          child: Text(
                        message!,
                        style: TextStyle(
                            color: K.mainColor,
                            fontSize: 16.sp),
                      )),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          ":الرسائل",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp),
                        ),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
