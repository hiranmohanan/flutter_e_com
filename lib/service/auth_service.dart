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
 
  }
  
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
  
  }