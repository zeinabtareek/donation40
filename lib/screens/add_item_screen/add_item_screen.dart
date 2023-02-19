import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/style.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final itemCountController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              // padding: EdgeInsets.all(5),

              decoration: K.boxDecoration,
              height: 300,
              child: Image.asset('assets/images/no.jpeg',fit: BoxFit.fill,)

            ),
            K.sizedBoxH,
            Container(
              // decoration: K.boxDecoration,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: itemCountController,
                decoration:  InputDecoration(
                  hintText: ' Item count',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red)

                  ),
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black12)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: K.primaryColor)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black12)
                  ),
                ),

              ),
            ),
            // K.sizedBoxH,
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),

              decoration: K.boxDecoration,
              height: 50,
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon:  Icon(Icons.add_location),),

                  Text('addreess',style: TextStyle(color: Colors.grey.shade700),),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
