import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../model/item_model.dart';
import '../../../model/user.dart';


class HistoryServices{
  final cloud=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  final realTimeDb =FirebaseDatabase.instance;//RealTime database







//func
//stream
//future , stream

  Future <UserModel>
  getUserDataFirebaseFirestore()async{
   final data = await FirebaseFirestore.instance.collection('users').doc('nhfXNkXbN3cRnMUqOIHglGujs902').get();
   // final data = await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).get();

   print(data);
    return UserModel.fromJson(data);


  }

  Stream<List<ItemModel>>getUerProducts() {//
    // await FirebaseFirestore.instance.collection('products').doc(auth.currentUser!.uid).collection('listOfItems').get();
 return FirebaseFirestore.instance.collection('products').doc(auth.currentUser!.uid).collection('listOfItems').snapshots()
     .transform(StreamTransformer.fromHandlers(handleData: (data,  sink){//event =>
       sink.add(data.docs.map((e) => ItemModel.fromJson(e)).toList());
       
 }));

  }
  deleteItem(id)async{
    await cloud.collection('products').doc(auth.currentUser!.uid).collection('listOfItems').doc(id).delete().then((value) {
      getUerProducts();
    });
  }


   getProductsFromRealTimeDatabase()async{
    return await realTimeDb.reference().child('products').child(auth.currentUser!.uid).child('listOfItems').get() ;
  }
}