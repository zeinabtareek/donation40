import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation40/screens/add_item_screen/add_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../componants/custom_button.dart';
import '../../componants/custom_main_card_screen.dart';
import '../../const/style.dart';
import 'controller/home_screen_controller.dart';
// view , domain (controller), service(app)
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller =Get.put(HomeScreenController());


  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // appBar: AppBar(),/**/
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Center(
  //           child: Button(
  //             width: MediaQuery.of(context).size.width/2,
  //             height: Get.height/20.h,
  //
  //             onPressed: () {
  //               Navigator.push(context, MaterialPageRoute(  builder: (BuildContext context)=>AddItemScreen() ));
  //
  //
  //             }, text: 'Add item', isFramed: false,),
  //         )
  //
  //       ],
  //     ),
  //   );
  // }
  // List homeAdsImages = [
  //   'https://sb.kaleidousercontent.com/67418/992x558/7632960ff9/people.png',
  //   'https://sb.kaleidousercontent.com/67418/992x558/7632960ff9/people.png',
  //   'https://sb.kaleidousercontent.com/67418/992x558/7632960ff9/people.png',
  //   'https://sb.kaleidousercontent.com/67418/992x558/7632960ff9/people.png',
  // ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(backgroundColor: K.primaryColor,),
          body: SingleChildScrollView(
              child: Column(children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              "assets/images/logo_green.png",
              height: 150.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ]),
        ),
        SizedBox(height: 10.h),
     Obx(()=>   CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: Get.height / 2.5.h,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                // setState(() {
                controller.change(index);
                // });
              }),
          items: controller.homeSliderAds
              .map((item) => Container(
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: K.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                      OctoImage(
                        image: CachedNetworkImageProvider(
                          item.image,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                            fit: BoxFit.cover),
                        errorBuilder: (context, url, error) {
                          return const BlurHash(
                              hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
                        },
                        fit: BoxFit.cover,
                      ),


          ))
              .toList(),
        ),
        ),
        SizedBox(
          height: 20.h,
        ),
        AnimatedSmoothIndicator(
          activeIndex: controller.currentImageIndex,
          count: 3,
          effect: ExpandingDotsEffect(
              dotHeight: 5,
              dotWidth: 5,
              activeDotColor: K.primaryColor,
              dotColor: K.primaryColor),
        ),
        K.sizedBoxH,
        CustomMainScreenCard(
            label: 'تبرع بالملابس',
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => AddItemScreen()));
            }),
      ]))),
    );
  }
}
