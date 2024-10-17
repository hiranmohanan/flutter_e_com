part of 'firebase_service.dart';

class FireAuthService {
  Future checkUser() async {
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

  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // If the user cancels the sign-in process
        throw Exception('Sign in aborted by user');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // if (userCredential.user == null) {
      //   throw Exception('Sign in failed');
      // }

      return userCredential;
    } catch (e) {
      // Handle the error accordingly
      debugPrint(e.toString());
      return Exception('Error during Google sign-in: ${e.toString()}');
    }
  }
  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return FireAuthResponce(isLoggedin: false);
    } catch (e) {
      return FireAuthResponce(isLoggedin: true, error: e.toString());
    }
  }
}
