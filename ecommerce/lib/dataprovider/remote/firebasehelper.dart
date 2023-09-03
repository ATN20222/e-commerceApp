import 'package:ecommerce/providers/custom_api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  final customApiService = CustomApiService();

  String getCurrentUsername() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.displayName ?? '';
    } else {
      return '';
    }
  }

  String getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid.hashCode.toString();
    } else {
      return '';
    }
  }

  String getCurrentUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email.toString();
    } else {
      return '';
    }
  }

  Future<dynamic> signUp(String email, String password, String name) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.currentUser!.updateDisplayName(name);
      if (user.user?.uid.hashCode != null) {
        customApiService.addUser(
            name, user.user!.uid.hashCode.toString(), email);
      }
      await auth.currentUser!.reload();
      if (user.user != null) return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "this email is already used";
      } else if (e.code == "weak-password") {
        return "password is too weak";
      }
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user != null) {
        return user.user;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<dynamic> signOut() async {
    await auth.signOut();
  }
}
