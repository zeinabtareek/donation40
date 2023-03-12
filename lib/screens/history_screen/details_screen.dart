import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../componants/custom_button.dart';
import '../../componants/custom_card_dtails.dart';
import '../../const/style.dart';
import '../../helpers/cache_helper.dart';
import '../../model/item_model.dart';
import 'controller/history_controller.dart';

class DetailsScreen extends StatelessWidget {
     final controller=Get.put(HistoryController());
     ItemModel itemModel;
  DetailsScreen({Key? key, required this.itemModel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: K.mainColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
        centerTitle: true,
        title: Text("order_details".tr,
            style: const TextStyle(
                fontSize:18, color: Colors.white)),
      ),
      body: Directionality(
        textDirection:  TextDirection.ltr,
        child: GetBuilder<HistoryController>(
          init: HistoryController(),
          builder: (controller)=>

    Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  "${controller.userModel.phone}",
                  // "${controller.userModel.name}",
                  // "${controller.userModel.name}",
                  // "${controller.userModel.name}",
                  style: TextStyle(
                      color: K.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  ": ${'name'.tr}",
                  style: TextStyle(
                      color: K.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      // controller.makePhoneCall("01004479160");..
                    },
                    icon: const Icon(
                      Icons.phone,
                      color: K.mainColor,
                    )),
                const Spacer(),
                Text(
                  "025255525525",
                  style: TextStyle(
                      color: K.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  ": ${'user_phone'.tr}",
                  style: TextStyle(
                      color: K.mainColor,
                      fontSize:16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {

                          // URLUtils.openMap(
                          //     double.parse(
                          // itemModel!.lat ??
                          //             ""),
                          //     double.parse(itemModel!.lng ??
                          //             ""));
                        },
                        icon: const Icon(
                          Icons.location_on_rounded,
                          color: K.mainColor,
                        )),
                    Expanded(
                       child: Text(
                        "address",
                        style: TextStyle(
                            color: K.mainColor,
                            fontSize: 14.sp,
                            // overflow:TextOverflow.ellipsis ,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      " :${'address'.tr} ",
                      style: TextStyle(
                          color: K.mainColor,
                          fontSize:16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                K.sizedBoxH,

              ],
            ),

            CustomCardDetails(
              image: itemModel.imageUrl.toString(),
              pieces: itemModel.pieces.toString(),
              message: "no_messages".tr,
              // message: "no_messages".tr,
              status: itemModel.status.toString(),
              date: itemModel.date.toString(),
            ),





          ],
        ),
      )
      )
    );



  }
}
