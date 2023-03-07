import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRepository {
  
  Future<String?> findRoleUserByEmail(String email) async {

    try{
      final String role = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get().then((QuerySnapshot querySnapshot) {
          return querySnapshot.docs[0]["role"];
          // for (var doc in querySnapshot.docs) {
          // debugPrint(doc["role"]);
          // }
      });
      return role;
    }catch(error){
      return null;
    }
  }
}