import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pegawaiediites_app/models/employee_model.dart';

class EmployeeRepository {

  Future<bool> save(EmployeeModel model) async{
    try{
      await FirebaseFirestore.instance
      .collection('employee').add(model.toJson());
      return true;
    }catch(error){
      return false;
    }
  }

  Future<EmployeeModel?> findEmployeeByEmail(String email) async {
    try{
      final EmployeeModel employee = await FirebaseFirestore.instance
        .collection('employee')
        .where('email', isEqualTo: email)
        .get().then((QuerySnapshot querySnapshot) {
          final json = querySnapshot.docs[0];
          return EmployeeModel(
            name: json["name"] ?? '',
            birth: json["birth"] ?? '',
            position: json["position"] ?? '',
            ktp: json["ktp"] ?? 0,
            email: json["email"] ?? '',
            gender: json["gender"] ?? '',
            address: json["address"] ?? '',
            isActive: json["isActive"] ?? false,
          );
      });
      return employee;
    }catch(error){
      return null;
    }
  }

}