import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pegawaiediites_app/models/employee_model.dart';
import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:pegawaiediites_app/models/user_login_request.dart';
import 'package:pegawaiediites_app/models/user_register_request.dart';
import 'package:pegawaiediites_app/repositories/employee_repository.dart';
import 'package:pegawaiediites_app/repositories/user_repository.dart';

class UserService {

  Future<String> register(UserRegisterRequest user) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      ).then((value) async{
        await UserRepository().save(user);
        await EmployeeRepository().save(EmployeeModel(
          name: user.name,
          email: user.email,
          isActive: false,
        ));
      });
      return 'Berhasil registrasi';
    } on FirebaseAuthException catch (e) {
      late String error;
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        error = 'Password lemah!';
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        error = 'Email telah terpakai!';
      }
      return error;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
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
        final employee = await EmployeeRepository().findEmployeeByEmail(credential.user?.email ?? '');
        sharedPrefModel.name = employee?.name;
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