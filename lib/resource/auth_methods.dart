import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_voting_app/models/user_model.dart';
import 'package:e_voting_app/utils/my_firebase_firestore_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // sign in
  Future<String> createAccount({required String email, required String password, required String name}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        String uid = userCredential.user!.uid;
        UserModel user = UserModel(
          fullName: name,
          email: email,
          uid: uid
        );
        await _firebaseFirestore.collection(userCollectionName).doc(uid).set(user.toJson());
        res = "success";
      } else {
        res = "All fields are required";
      }
    } on FirebaseAuthException catch(err) {
      if (err.code == "invalid-email") {
        res = "Invalid email address";
      } else if (err.code == "weak-password") {
        res = "Your password should be at least 6 characters";
      } else if (err.code == "wrong-password") {
        res = "Your password is incorrect";
      } else if (err.code == "user-not-found") {
        res = "Account not available. Check your email and password";
      } else {
        res = err.code;
      }
    } catch(err) {
      res = err.toString();
    }
    return res;
  }
}
