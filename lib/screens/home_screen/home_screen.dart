import 'package:donation40/screens/add_item_screen/add_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),/**/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Button(
              width: MediaQuery.of(context).size.width/2,
              height: Get.height/20.h,

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(  builder: (BuildContext context)=>AddItemScreen() ));


              }, text: 'Add item', isFramed: false,),
          )

        ],
      ),
    );
  }
}
