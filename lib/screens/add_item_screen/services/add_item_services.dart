import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../model/item_model.dart';
import '../../auth_screen/services/auth_services.dart';

class AddItemServices {
  final authSer = AuthServices();
  final cloud = FirebaseFirestore.instance;
  final storage=FirebaseStorage.instance;

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





}
