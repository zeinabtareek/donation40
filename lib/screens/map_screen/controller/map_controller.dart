import 'package:donation40/helpers/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../componants/snackbar.dart';

class MapController extends GetxController{

  String areaNumber='';
  TextEditingController restAddress=TextEditingController();
  TextEditingController apartmentNumber=TextEditingController();

  LatLng  currentLocation=LatLng(0.0, 0.0);
static LatLng ?position1;
final markers=<Marker>[];
// final MarkerId markerId;
onInit(){
  // position1;
  getCurrentLocation(BuildContext);
}
  Future<bool> _handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackBar(context,'Location services are disabled. Please enable the services');

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));


        showSnackBar(context,'Location permissions are denied');

  return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showSnackBar(context,'Location permissions are permanently denied, we cannot request permissions.');

      return false;
    }
    return true;
  }

  getCurrentLocation(context)async{
    final checkPermission= await _handleLocationPermission(context);
    if(!checkPermission)return;//case nooo
     await Geolocator.getCurrentPosition(
      desiredAccuracy:LocationAccuracy.high,
    ).then((   position) async {
      print('position.latitude :${position.latitude}');
      print('position.longitude :${position.longitude}');
     await CacheHelper.saveData(key: 'latitude', value: position.latitude);
     await CacheHelper.saveData(key: 'longitude', value: position.longitude);
      // currentLocation.longitude
      // =position.longitude;
     // await addMarkerOnMap(position);
      position1=LatLng(position.latitude, position.longitude);



     });
  }


  addMarkerOnMap(currentLocation){
  try{
    markers.add(Marker(markerId: MarkerId('this is my marker'),position:currentLocation ,
        infoWindow:InfoWindow(title: 'location'),
     ));


  }catch(e){
    print(e);
  }
  }


}