import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
 import '../../componants/custom_button.dart';
import '../../const/style.dart';
 import '../../helpers/cache_helper.dart';
 import '../../model/item_model.dart';
import 'controller/history_controller.dart';
import 'details_screen.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({
    Key? key,
  }) : super(key: key);

    final controller=Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {



    return Scaffold(

      // appBar:ArrowsAppBar( "track".tr),
      body:  SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    //           StreamBuilder<List<ItemModel>>(
    //             stream:controller.getProducts() ,
    //               builder: (context ,AsyncSnapshot ?snapshot){
    //               if(snapshot!.hasData&& snapshot.data!=null){
    //             return   ListView.builder(
    //                 shrinkWrap: true,
    //                 physics: NeverScrollableScrollPhysics(),
    //                 // itemCount: 3,
    //                 itemCount: snapshot.data.length,
    //                 itemBuilder: (build, index) => Padding(
    //                     padding:
    //                     const EdgeInsets.only(bottom: 18.0),
    //                     child: Directionality(
    //                         textDirection:  TextDirection.ltr ,
    //                         child: Card(
    //                           elevation: 3,
    //                           shadowColor: K.mainColor,
    //                           shape: RoundedRectangleBorder(
    //                               side:   BorderSide(
    //                                   color: K.mainColor, width: 3),
    //                               borderRadius:
    //                               BorderRadius.circular(15)),
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Directionality(
    //                               textDirection: TextDirection.ltr,
    //                               child: Row(
    //                                   mainAxisAlignment:
    //                                   MainAxisAlignment.start,
    //                                   crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                                   children: [
    //                                     Expanded(
    //                                       child: Column(
    //                                         crossAxisAlignment:
    //                                         CrossAxisAlignment
    //                                             .start,
    //                                         mainAxisAlignment:
    //                                         MainAxisAlignment
    //                                             .start,
    //                                         children: [
    //                                           Row(
    //                                             mainAxisAlignment:
    //                                             MainAxisAlignment
    //                                                 .start,
    //                                             crossAxisAlignment:
    //                                             CrossAxisAlignment
    //                                                 .start,
    //                                             children: [
    //                                               Container(
    //                                                   height: 150.h,
    //                                                   // width: 150.w,
    //                                                   clipBehavior: Clip.antiAlias,
    //                                                   width: MediaQuery.of(context).size.width /3,
    //                                                   decoration: BoxDecoration(
    //                                                     border:
    //                                                     Border.all(color: K.primaryColor, width: 2),
    //                                                     borderRadius: BorderRadius.circular(5),
    //                                                   ),
    //                                                   child: OctoImage(
    //                                                     image:   CachedNetworkImageProvider(
    //                                                       snapshot.data[index].imageUrl,
    //                                                     ),
    //                                                     placeholderBuilder: OctoPlaceholder.blurHash(
    //                                                         'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
    //                                                         fit: BoxFit.cover),
    //                                                     errorBuilder: (context, url, error) {
    //                                                       return const BlurHash(
    //                                                           hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
    //                                                     },
    //                                                     fit: BoxFit.cover,
    //                                                   )),
    //
    //
    //
    //                                               Expanded(
    //                                                 child: Column(
    //                                                   children: [
    //                                                     Container(
    //                                                       decoration:
    //                                                       BoxDecoration(
    //                                                         border: Border.all(
    //                                                             color:
    //                                                             Colors.grey.shade400,
    //                                                             width: 2),
    //                                                         borderRadius:
    //                                                         BorderRadius.circular(10),
    //                                                       ),
    //                                                       margin: EdgeInsets.only(
    //                                                         bottom: 20
    //                                                             .h,
    //                                                         left: 10
    //                                                             .w,
    //                                                       ),
    //                                                       child:
    //                                                       Row(
    //                                                         mainAxisAlignment:
    //                                                         MainAxisAlignment.spaceBetween,
    //                                                         children: [
    //                                                           Text(
    //                                                             " ${'date'.tr} :",
    //                                                             // "التاريخ :".tr,
    //                                                             style: TextStyle(
    //                                                                 color: Colors.black,
    //                                                                 fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,
    //                                                                 fontSize: 18.sp),
    //                                                           ),
    //                                                           Text(  snapshot.data[index].date,
    //                                                             style: TextStyle(
    //                                                                 color: Colors.red,
    //                                                                 fontWeight: FontWeight.bold,
    //                                                                 fontSize: 16.sp),
    //                                                           ),
    //                                                         ],
    //                                                       ),
    //                                                     ),
    //                                                     Row(
    //                                                       mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .start,
    //                                                       children: [
    //                                                         Text(
    //                                                           " ${'Number of pieces'.tr} :",
    //                                                           style: TextStyle(
    //                                                               color: Colors.black,
    //                                                               fontSize: 20.sp,
    //                                                               fontWeight: FontWeight.bold),
    //                                                         ),
    //                                                         K.sizedBoxW,
    //                                                         Text(
    //                                                             snapshot.data[index].pieces,
    //                                                           style: TextStyle(
    //                                                               color: Colors.black,
    //                                                               fontSize: 20.sp,
    //                                                               fontWeight: FontWeight.bold),
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                     Row(
    //                                                       mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .start,
    //                                                       children: [
    //                                                         Text(
    //                                                           " ${'status'.tr} :",
    //
    //                                                           style: TextStyle(
    //                                                               color: Colors.black,
    //                                                               fontSize: 20.sp,
    //                                                               fontWeight: FontWeight.bold),
    //                                                         ),
    //                                                         K.sizedBoxW,
    //                                                         Text(
    //                                                           "gggf",
    //                                                           style: TextStyle(
    //                                                               color: K.primaryColor,
    //                                                               fontSize: 18.sp,
    //                                                               fontWeight: FontWeight.bold),
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                           GetBuilder<
    //                                               HistoryController>(
    //                                             init:
    //                                             HistoryController(),
    //                                             builder:
    //                                                 (controller) =>
    //                                                 Align(
    //                                                   alignment: Alignment
    //                                                       .centerLeft,
    //                                                   child: SizedBox(
    //                                                     child: Row(
    //                                                       mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .spaceAround,
    //                                                       children: [
    //                                                         Button(
    //                                                           isFramed:
    //                                                           true,
    //                                                           text:
    //                                                           "cancel".tr,
    //
    //                                                           height:  MediaQuery.of(context).size.height / 20.h,
    //
    //                                                           onPressed:(){
    //                                                             controller.deleteItem(snapshot.data[index].date.toString());
    //
    //                                                           }, width: 100,
    //                                                         ),
    //
    //                                                         Button(
    //                                                           isFramed:
    //                                                           false,
    //                                                           text:
    //                                                           "details".tr,
    //                                                           height: MediaQuery.of(context).size.height / 20.h,
    //
    //                                                           onPressed:
    //                                                               () async {
    //                                                             Get.to(() =>
    //                                                                 DetailsScreen(itemModel:snapshot.data[index] ));
    //                                                           }, width: 100,
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ]),
    //                             ),
    //                           ),
    //                         )))
    //               /**********************************************the End********************************************************/
    //             );
    //           }else{
    //                 return Text('no data');
    // }
    // }
    //               ),
              ///future builder
                FutureBuilder<List<ItemModel>>(
                    future:controller.getProductsFromRealTimeDatabase() ,
                    builder: (context ,AsyncSnapshot ?snapshot){
                      if(snapshot!.hasData&& snapshot.data!=null){
                        return   ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // itemCount: 3,
                            itemCount: snapshot.data.length,
                            itemBuilder: (build, index) => Padding(
                                padding:
                                const EdgeInsets.only(bottom: 18.0),
                                child: Directionality(
                                    textDirection:  TextDirection.ltr ,
                                    child: Card(
                                      elevation: 3,
                                      shadowColor: K.mainColor,
                                      shape: RoundedRectangleBorder(
                                          side:   BorderSide(
                                              color: K.mainColor, width: 3),
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                              height: 150.h,
                                                              // width: 150.w,
                                                              clipBehavior: Clip.antiAlias,
                                                              width: MediaQuery.of(context).size.width /3,
                                                              decoration: BoxDecoration(
                                                                border:
                                                                Border.all(color: K.primaryColor, width: 2),
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              child: OctoImage(
                                                                image:   CachedNetworkImageProvider(
                                                                  snapshot.data[index].imageUrl,
                                                                ),
                                                                placeholderBuilder: OctoPlaceholder.blurHash(
                                                                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                                                    fit: BoxFit.cover),
                                                                errorBuilder: (context, url, error) {
                                                                  return const BlurHash(
                                                                      hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
                                                                },
                                                                fit: BoxFit.cover,
                                                              )),



                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                        Colors.grey.shade400,
                                                                        width: 2),
                                                                    borderRadius:
                                                                    BorderRadius.circular(10),
                                                                  ),
                                                                  margin: EdgeInsets.only(
                                                                    bottom: 20
                                                                        .h,
                                                                    left: 10
                                                                        .w,
                                                                  ),
                                                                  child:
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        " ${'date'.tr} :",
                                                                        // "التاريخ :".tr,
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,
                                                                            fontSize: 18.sp),
                                                                      ),
                                                                      Text(  snapshot.data[index].date,
                                                                        style: TextStyle(
                                                                            color: Colors.red,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 16.sp),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                      " ${'Number of pieces'.tr} :",
                                                                      style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 20.sp,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                    K.sizedBoxW,
                                                                    Text(
                                                                      snapshot.data[index].pieces,
                                                                      style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 20.sp,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                      " ${'status'.tr} :",

                                                                      style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 20.sp,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                    K.sizedBoxW,
                                                                    Text(
                                                                      "gggf",
                                                                      style: TextStyle(
                                                                          color: K.primaryColor,
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      GetBuilder<
                                                          HistoryController>(
                                                        init:
                                                        HistoryController(),
                                                        builder:
                                                            (controller) =>
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: SizedBox(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                                  children: [
                                                                    Button(
                                                                      isFramed:
                                                                      true,
                                                                      text:
                                                                      "cancel".tr,

                                                                      height:  MediaQuery.of(context).size.height / 20.h,

                                                                      onPressed:(){
                                                                        controller.deleteItem(snapshot.data[index].date.toString());

                                                                      }, width: 100,
                                                                    ),

                                                                    Button(
                                                                      isFramed:
                                                                      false,
                                                                      text:
                                                                      "details".tr,
                                                                      height: MediaQuery.of(context).size.height / 20.h,

                                                                      onPressed:
                                                                          () async {
                                                                        Get.to(() =>
                                                                            DetailsScreen(itemModel:snapshot.data[index] ));
                                                                      }, width: 100,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    )))
                          /**********************************************the End********************************************************/
                        );
                      }else{
                        return Text('no data');
                      }
                    }
                ),
              ]),
        ),

    );
  }
}
