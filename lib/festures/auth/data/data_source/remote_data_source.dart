import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_ai/festures/auth/data/model/user_model.dart';

class RemoteDataSource {
  Future<UserModel> signUp(
      String email, String password, String fullname) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(fullname);


      return UserModel(
        email: userCredential.user!.email!,
        fullname: fullname ,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserModel> logIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return UserModel(
        email: userCredential.user!.email!,
        fullname: userCredential.user!.displayName!,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
