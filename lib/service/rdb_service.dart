part of 'firebase_service.dart';

class FireRDbService {
  Future<DatabaseReference> get initDB async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
    return ref;
  }

  Future getData({String? key}) async {
    final ref = FirebaseDatabase.instance.ref("iteams");
     List<FireRdbData> list = [];
    ref.onValue.listen((event) {
      Map<dynamic, dynamic>? data =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        data.forEach((key, value) {
          list.add(FireRdbData.fromMap(value));
        });
      }
    });
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

  Future<void> addWishList({required FireRdbData data}) async {
    final ref = await initDB;
    final newref = ref.child("wishlist");

    await newref.push().set({
      "id": newref.key,
      "name": data.name,
      "price": data.price,
      "image": data.image,
    });
  }

  Future getWishList() async {
    final ref = await initDB;
    final newref = ref.child("wishlist");
    List<FireRdbData> list = [];
    newref.onValue.listen((event) {
      Map<dynamic, dynamic>? data =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        data.forEach((key, value) {
          list.add(FireRdbData.fromMap(value));
        });
      }
    });
  }

  Future<void> addCart({required FireRdbData data}) async {
    final ref = await initDB;
    final newref = ref.child("cart");

    await newref.push().set({
      "id": newref.key,
      "name": data.name,
      "price": data.price,
      "image": data.image,
    });
  }
  Future getCart() async {
    final ref = await initDB;
    final newref = ref.child("cart");
    List<FireRdbData> list = [];
    newref.onValue.listen((event) {
      Map<dynamic, dynamic>? data =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        data.forEach((key, value) {
          list.add(FireRdbData.fromMap(value));
        });
      }
    });
  }
}
