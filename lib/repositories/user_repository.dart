import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pegawaiediites_app/models/user_register_request.dart';

class UserRepository {

  Future<bool> save(UserRegisterRequest user) async{
    try{
      await FirebaseFirestore.instance
      .collection('user').add({
        'email' : user.email,
        'role' : 'user',
      });
      return true;
    }catch(error){
      return false;
    }
  }
  
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