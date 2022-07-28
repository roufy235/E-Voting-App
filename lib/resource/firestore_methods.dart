import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_voting_app/utils/my_firebase_firestore_constants.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> matricNoVerification(String matricNo) async {
    try {
      DocumentSnapshot snap = await _firebaseFirestore.doc('$matricCollection/$matricNo').get();
      return snap.exists;
    } catch (_) {}
    return false;
  }
}
