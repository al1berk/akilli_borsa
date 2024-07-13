import 'package:firebase_auth/firebase_auth.dart';

class FirebaseModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Kullanıcı kaydı başarılı: ${userCredential.user!.uid}');
    } catch (e) {
      print('Kullanıcı kaydı başarısız: $e');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Kullanıcı oturum açtı: ${userCredential.user!.uid}');
    } catch (e) {
      print('Kullanıcı oturum açma başarısız: $e');
    }

    Future<void> signOut() async {
      try {
        await _auth.signOut();
        print('Kullanıcı çıkış yaptı');
      } catch (e) {
        print('Çıkış işlemi başarısız: $e');
      }
    }

  }




}
