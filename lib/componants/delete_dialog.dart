import 'package:donation40/const/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import '../helpers/cache_helper.dart';
 import '../screens/history_screen/controller/history_controller.dart';

class DeleteDialog extends StatelessWidget {

  DeleteDialog({super.key,required this.id});
  static final HistoryController _controller = Get.put(HistoryController());
    final translateName = CacheHelper.getData(key: "localeIsArabic");

    String id;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection:translateName==false?TextDirection.ltr:TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)), //this right here

        child: Container(
          width: w * 0.8,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "are_you_sure_you_want_to_delete_this_item".tr,
                    style:TextStyle( fontWeight: FontWeight.w700, fontSize: 12.0.sp),
                  ),
                  IconButton(
                      onPressed: () => Get.back(), icon:   Icon(Icons.close))
                ],
              ),
           Row(mainAxisSize: MainAxisSize.min, children: [



             K.sizedBoxH,
              TextButton(onPressed:(){
               },
                  child: Text('yes'.tr,style: TextStyle(fontSize: 20.sp),)),
              TextButton(onPressed:(){
                Get.back();
              }, child: Text('no'.tr,style: TextStyle(fontSize: 20.sp),)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
