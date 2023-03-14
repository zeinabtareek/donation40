///4
class FirebaseBranchModel{


// List<Data>  data;
  String ?address_ar;
  String ?address_en;
  bool ?available;
  String ?database;
  String ?id;
  String ?lat;
  String ?lng;
  String ?name_ar;
  String ?name_en;
  FirebaseBranchModel({
    required this.lng,
    required this.lat,
    required this.address_ar,
    required this.address_en,
    // required this.data,
    required this.available,
    required this.database,
    required this.name_ar,
    required this.name_en,
    required this.id,
   });


 toJson(){
   Map  <dynamic,dynamic> data={};
   data['database']=database;
   data['id']=id;
   data['name_en']=name_en;
   data['name_ar']=name_ar;
   data['available']=available;
   data['address_en']=address_en;
   data['address_ar']=address_ar;
   data['lat']=lat;
   data['lng']=lng;
   return data;
 }

///display
 FirebaseBranchModel.fromMap( Map  <dynamic,dynamic>  json ){
   database=json['database'];
   lng=json['lng'];
   lat=json['lat'];
   address_ar=json['address_ar'];
   available=json['available'];
   name_en=json['name_en'];
   name_ar=json['name_ar'];
   id=json['id'];

 }
}

// class Data{
//
// }