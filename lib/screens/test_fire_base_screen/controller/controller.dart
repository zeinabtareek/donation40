import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation40/model/branch_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class TestFirebaseController extends GetxController{

  String text='test';
  final text1=''.obs;

final db =FirebaseDatabase.instance;
final cloud =FirebaseFirestore.instance;
@override
onInit(){
  super.onInit();
  getDataDatbase();
}
RxList <FirebaseBranchModel> firebaseBranches=[FirebaseBranchModel(
    lng: '',
    lat: '',
    address_ar: '',
    address_en: '',
    available: true,
    database: '',
    name_ar: '',
    name_en: '',
    id: ''
)].obs;

addToFirebaseFireStore(FirebaseBranchModel firebaseBranchModel)async{//collections,doc
  await cloud.collection('branches').doc('branch1').set(firebaseBranchModel.toJson());
}
addToFirebaseRealTime(FirebaseBranchModel firebaseBranchModel)async{  //child
  await db.reference().child('branches').child('branch1').set(firebaseBranchModel.toJson());
}
getDataDatbase()async{
  await db.reference().child('branches').get().then((snapshot) { //branch1 ,branch2,branch3
    var values=snapshot.value;
    values.forEach((key,value){ //(address_ar )(37W4+2VG، معمل الالبان، العزب، قسم الشرابية، محافظة القاهرة‬ 4361360، مصر)
      firebaseBranches.add(FirebaseBranchModel.fromMap(value));
      print(value);

    });

    // for(var i in values)


  });

}


}