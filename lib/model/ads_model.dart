import 'package:cloud_firestore/cloud_firestore.dart';

///  4
class AdsModel{
  String ? name;
  String ?image;
  AdsModel({this.image,this.name});

  factory AdsModel.fromson(DocumentSnapshot snapshot){
    return AdsModel(
      image: snapshot['image'],
      name: snapshot['name'],
    );
  }


}