import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context ,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),duration: Duration(seconds: 5),backgroundColor: Colors.black.withOpacity(.5),)
  );
}