import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:pegawaiediites_app/models/user_login_request.dart';
import 'package:pegawaiediites_app/repositories/user_repository.dart';

class UserService {

  Future register(UserLoginRequest user) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<SharedPrefModel?> login(UserLoginRequest user) async{
    try {
      SharedPrefModel sharedPrefModel = SharedPrefModel();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      final role = await UserRepository().findRoleUserByEmail(credential.user?.email ?? '');
      sharedPrefModel.name = 'Admin';
      sharedPrefModel.email = user.email!;
      sharedPrefModel.role = role;
      if (role != 'admin'){
        sharedPrefModel.name = 'User';
      }
      return sharedPrefModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      return null;
    }
  }
}