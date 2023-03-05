import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices
{
  //
  final auth =FirebaseAuth.instance;//1- enable,2-package
  final store =FirebaseFirestore.instance;//

}