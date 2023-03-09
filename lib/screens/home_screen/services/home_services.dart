
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenServices{
  final cloud=FirebaseFirestore.instance;



  getAds()async{


    return await  cloud.collection('ads').get();
  }

}