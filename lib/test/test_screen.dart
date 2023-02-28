import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/test_controller.dart';

class TestScreen extends StatelessWidget{
    TestScreen({super.key});

    TestController testController =Get.put(TestController());

//listen
// Obx =>name.value ,setState
// GetX//syntax
// GetBuilder = Update //syntax


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
         /// GetBuilder
        child: GetBuilder<TestController>(
          init: TestController(),
          builder: (value)=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${value.counter}'),

              TextButton(onPressed: (){
                value.increment();
                //increment()
              }, child: Text('click'))
            ],
          ),

        )
        ///GetX
         // child: GetX<TestController>(
      //       init: TestController(),
      //       builder: (controller)=> Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text('${controller.counter2.value}'),
      //           TextButton(onPressed: (){
      //             controller.increment2();
      //            }, child: Text('click'))
      //         ],
      //       ),
      //
      //     )
      //
          ///OBX
          // child: Obx(()=> Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text('${testController.counter2.value}'),
          //       TextButton(onPressed: (){
          //         testController.increment2();
          //        }, child: Text('click'))
          //     ],
          //   ),
          //
          // )

      ),
    );
  }
}