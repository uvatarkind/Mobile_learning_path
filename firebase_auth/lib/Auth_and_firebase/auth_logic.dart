import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> SignUp(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      UserCredential response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(response);
      String userId = response.user!.uid;
      await _firestore
          .collection('users')
          .doc(userId)
          .set({'fullname': name, 'phone': phone, 'email': email});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("SuccessFully logged in.");
    }catch(e){
      print("Error: $e");
    }
  }
}