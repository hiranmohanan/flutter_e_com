part of 'firebase_service.dart';

class FireAuthService{
  Future checkUser() async{
    try {
User? user = await FirebaseAuth.instance.authStateChanges().first;
if (user == null) {
  return FireAuthResponce(isLoggedin: false);
} else {
  return FireAuthResponce.fromFirebase(user);
}
} catch (e) {
  return FireAuthResponce(isLoggedin: false, error: e.toString());
  }
 
  }}