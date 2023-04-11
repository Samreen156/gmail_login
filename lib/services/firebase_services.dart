import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices{

  // The class has two private variables _auth and _googleSignIn which are instances of
  // the FirebaseAuth and GoogleSignIn classes respectively.
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  /*The signInWithGoogle() method uses the _googleSignIn instance to sign in with Google,
   and then uses the GoogleAuthProvider class to get an authentication credential.
   This credential is then used to sign in with Firebase using the _auth instance.*/
  signInWithGoogle() async{
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
       if(googleSignInAccount !=null) {
       final GoogleSignInAuthentication googleSignInAuthentication =
         await googleSignInAccount.authentication;
       final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
       );
       await _auth.signInWithCredential(authCredential);
       }
    } on FirebaseAuthException catch(e){
     print(e.message);
     throw e;
    }
  }

  //The signOut() method signs out the user from both Firebase and Google.
  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

}