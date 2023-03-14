import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../model/item_model.dart';
import '../../auth_screen/services/auth_services.dart';

class AddItemServices {
  final authSer = AuthServices();
  final cloud = FirebaseFirestore.instance; //cloud firestore
  final storage=FirebaseStorage.instance;
  final realTimeDb =FirebaseDatabase.instance;//RealTime database

  addItemToFirebase(ItemModel itemModel, time) async {
    try {
      await cloud
          .collection('products')
          .doc(authSer.auth.currentUser!.uid)
          .collection('listOfItems')
          .doc(time)
          .set(itemModel.toJson());
    } catch (e) {
      print(e);
    }
  }



  addItemToRealTimeDatabase(ItemModel itemModel, time) async {
    try { //ref ...child
      // await realTimeDb.reference().child('Cart').child('branch1').child('token').child('dateTime') .set(itemModel.toJson());
      await realTimeDb.reference().child('products').child(authSer.auth.currentUser!.uid).child('listOfItems').child(time).set(itemModel.toJson());

    } catch (e) {
      print(e);
    }
  }





}
