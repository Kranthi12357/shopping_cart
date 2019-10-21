import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum status{
  Unintialized,Authenticated,
  Authenticating,Unauthenticated
}

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  FirebaseUser _currentuser;
  GoogleSignIn _googleSignIn;
  status _status = status.Unintialized;
  //Firestore db = Firestore.instance;

  UserProvider.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn =GoogleSignIn(){
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = status.Unauthenticated;
    } else {
      _user = firebaseUser;

      _status = status.Authenticated;

    }

    notifyListeners();
  }


  status get statuss => _status;

  FirebaseUser get user => _user;
  FirebaseUser get currentuser =>_currentuser;

  Future<String> signInWithGoogle() async {

    try {

      _status = status.Authenticating;

      notifyListeners();

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =

      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(

        accessToken: googleAuth.accessToken,

        idToken: googleAuth.idToken,

      );

     final AuthResult =  await _auth.signInWithCredential(credential);
      FirebaseUser _user = AuthResult.user;
      _currentuser = await _auth.currentUser();
      //addUsers();
      notifyListeners();
      return "$_user";

    } catch (e) {

      print(e);

      _status = status.Unauthenticated;

      notifyListeners();

      return "no user";

    }

  }
  Future signOut() async {

    _auth.signOut();

    _googleSignIn.signOut();

    _status = status.Unauthenticated;

    notifyListeners();

    return Future.delayed(Duration.zero);

  }


}