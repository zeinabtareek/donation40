import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices
{
  final auth =FirebaseAuth.instance;
  final store =FirebaseFirestore.instance;

}