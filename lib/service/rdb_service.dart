part of 'firebase_service.dart';

class FireRDbService{
  Future get initDB async{
    String uid=FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
    return ref;
  }
 Future getData({String? key})async{
    final ref = FirebaseDatabase.instance.ref("iteams");
    if(key!=null){
      ref.child(key).once().then((DatabaseEvent snapshot) {
        if (kDebugMode) {
          print('Data : ${snapshot.snapshot.value}');
        }
      });
    }else{
      ref.once().then((DatabaseEvent snapshot) {
        if (kDebugMode) {
          print('Data : ${snapshot.snapshot.value}');
        }
      });
    }
 }
  Future<void> addProduct({required FireRdbData data}) async {
    final ref = FirebaseDatabase.instance.ref("iteams");

    await ref.push().set({
      "id": ref.key,
      "name": data.name,
      "price": data.price,
      "image": data.image,

    });
  }

  
}