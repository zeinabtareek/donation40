class ItemModel{
  //variables , constructor , map toJson, Map fromJson
//
  ///first step (Variables)
  String ?imageUrl;
  String ?pieces;
  String ?address;
  String ?status;
  String ?time;
  String ?lat;
  String ?lng;
  String ?userToken;
  String ?date;
  String ?landMark;
  String ?areaNumber; //5
  String ?apartmentNumber;
///sec step (constructor)

  ItemModel({this.date,
    this.time,
    this.apartmentNumber,this.lng,this.lat,this.status,
    this.imageUrl,
    this.areaNumber, //pointer 5
    this.address,
    this.landMark,
    this.pieces,
    this.userToken});
///third step tojson(Map)

  toJson(){
  Map<String, dynamic> data={};
  data['imageUrl']=imageUrl;
  data['lat']=lat;
  data['time']=time;
  data['date']=date;
  data['lng']=lng;
  data['status']=status;
  data['apartmentNumber']=apartmentNumber;
  data['areaNumber']=areaNumber;
  data['address']=address;
  data['landMark']=landMark;
  data['pieces']=pieces;
  data['userToken']=userToken;
  return data;
} //to database()

///forth step fromJson(Map)
//parameter
//set ,update

  ItemModel.fromJson(Map json){
    date=json['date'];
    pieces=json['pieces'];
    address=json['address'];
    time=json['time'];
    lat=json['lat'];
    lng=json['lng'];
    imageUrl=json['imageUrl'];
    userToken=json['userToken'];
    apartmentNumber=json['apartmentNumber'];
    status=json['status'];
    landMark=json['landMark'];
    areaNumber=json['areaNumber'];
  }
}



//
// Map data2={};
// data2['name']='mcn';