import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:get/get.dart';

import '../../componants/custom_button.dart';
import '../../componants/row_mmore_info.dart';
import '../../const/style.dart';
import '../../data.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController feedBackController=TextEditingController();
    final formKey=GlobalKey<FormState>();
    ScrollController scrollController=ScrollController();
    AnimationController ?controllerz;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phone Numbers'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
            itemBuilder: (context,index){
          return  RowMoreInfoScreen(text: '098r754e7483', widget:Icon(Icons.phone,color: K.primaryColor,));
        }),
          K.sizedBoxH,
          Text('Socials'),

          ListView.builder(
          shrinkWrap: true,
          itemCount: socials.length,
            itemBuilder: (context,index){
          return  RowMoreInfoScreen(text: '${socials[index]['text']}', widget: socials[index]['icon']);
        }),
          K.sizedBoxH,


          Center(
            child: Button(
              width: MediaQuery.of(context).size.width/2,
              height: Get.height/20.h,

              onPressed: () {


              }, text: 'Delete Account', isFramed: true,),
          )

        ],
      ),
        floatingActionButton:ScrollingFabAnimated(
            color:K.primaryColor,
          icon: Icon(Icons.contact_support,color:K.whiteColor ),
          width:150,
          text: Text('Feedback',style: TextStyle(color:K.whiteColor ,fontSize: 16.sp),),
          onPress: () {
              setState(() {


          showModalBottomSheet(context: context,transitionAnimationController: controllerz, builder: (BuildContext context){

            return AnimatedContainer(duration: Duration(seconds: 2),
            child: Padding(
              padding: EdgeInsets.only(
                bottom:10.h, //
                // bottom: MediaQuery.of(context).viewInsets.bottom,

              ),
                child:AnimatedCrossFade(

                  firstChild: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Padding(padding: EdgeInsets.all(20),
                      child:   TextFormField(
                        controller: feedBackController,
                        decoration: InputDecoration(
                          hintText: 'Send Feedback',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.red)

                          ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black12)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: K.primaryColor)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black12)
                          ),
                        ),
                        validator: (v){
                          if(v!.isEmpty ||v==null){
                            return 'Please enter Some text';
                          }
                          return null;
                        },
                      ),
                      ),


                        Button(width: MediaQuery.of(context).size.width/1.4, height: Get.height/20.h,
                          onPressed: () {
                          if(formKey.currentState!.validate()){
                            print('valid');

                          }
                          else{
                            print('Not Valid');
                          }

                        }, text: 'send feedback', isFramed: false,)






                      ],
                    ),
                  ),

                  secondChild: Text('try'), crossFadeState: CrossFadeState.showFirst, duration: Duration(seconds: 1),
                )
            ),);
          });
              });
           }, scrollController: scrollController,)



    );
  }
}
