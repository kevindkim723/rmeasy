import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository{
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;


  UserRepository({
    FirebaseAuth fireBaseAuth,
    FirebaseFirestore firestore
}): _firebaseAuth = fireBaseAuth?? FirebaseAuth.instance, _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> signInWithEmail(String email, String password)
  {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }


  Future<bool> isFirstTime(String userId) async {
    bool exist;
    await FirebaseFirestore.instance.collection('users').doc(userId).get().then((user) {
      exist= user.exists;
    });
    return exist;
  }
  Future<void> signUpWithEmail(String email, String password) async
  {
    print(_firebaseAuth);
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future<void> signOut() async
  {
    return await _firebaseAuth.signOut();
  }
  Future<bool> isSignedIn() async{
    final currentUser = _firebaseAuth.currentUser;
    return currentUser!=null;
  }

  Future<String> getUser()async
  {
    return (await _firebaseAuth.currentUser).uid;
  }


}