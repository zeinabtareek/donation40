import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../componants/custom_button.dart';
import '../../componants/custom_main_card_screen.dart';
import 'controller/controller.dart';

class TestFirebaseScreen extends StatelessWidget {
    TestFirebaseScreen({Key? key}) : super(key: key);
  final controller=Get.put(TestFirebaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: Row(
                children: [
                  Button(
                    width: MediaQuery.of(context).size.width / 2,
                    height: Get.height / 20.h,
                    onPressed: () {
                      // controller.addToFirebaseFireStore(firebaseBranchModel)


                    },
                    text: 'add Cloud Fire store',
                    isFramed: false,
                  ),
                  CustomMainScreenCard(
                      label: 'add Real Time', onTap: () {
                    // controller.addToFirebaseRealTime(firebaseBranchModel)


                  }),

                  // GetBuilder<TestFirebaseController>(
                  //     init: TestFirebaseController(),
                  //     builder: (controller){
                  //
                  //   return Text(controller.text);
                  // }),
                 //
                 //  GetX<TestFirebaseController>(
                 //      init: TestFirebaseController(),
                 //      builder: (controller){
                 //
                 //    return Text('${controller.text1.value}');
                 //  }),
                 // Obx(() {
                 //   return
                 // Text(controller.text1.value);
                 // }),
                 //
///FetchDataFromRealDB

               Obx(()=>   ListView.builder(
                   itemCount: controller.firebaseBranches.length,
                   shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (BuildContext context,index){
                     return  Button(
                       width: MediaQuery.of(context).size.width / 2,
                       height: Get.height / 20.h,
                       onPressed: () { },
                       text: controller.firebaseBranches[index].name_ar.toString(),
                       isFramed: false,
                     );


                   }))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
