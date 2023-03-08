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
            id: json.id,
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

  Future<bool> update(EmployeeModel model) async{
    try{
      await FirebaseFirestore.instance
      .collection('employee').doc(model.id).update(model.toJson());
      return true;
    }catch(error){
      return false;
    }
  }

  Future<bool> remove(String id) async{
    try{
      await FirebaseFirestore.instance
      .collection('employee').doc(id).delete();
      return true;
    }catch(error){
      return false;
    }
  }

  Future<List<EmployeeModel>> getAll() async {
    try{
      final List<EmployeeModel> employee = await FirebaseFirestore.instance
        .collection('employee')
        .get().then((QuerySnapshot querySnapshot) {
          List<EmployeeModel> list = [];
          for (var json in querySnapshot.docs) {
            list.add(
              EmployeeModel(
                id: json.id,
                name: json["name"] ?? '',
                birth: json["birth"] ?? '',
                position: json["position"] ?? '',
                ktp: json["ktp"] ?? 0,
                email: json["email"] ?? '',
                gender: json["gender"] ?? '',
                address: json["address"] ?? '',
                isActive: json["isActive"] ?? false,
              )
            );
          }
          return list;
      });
      return employee;
    }catch(error){
      return [];
    }
  }

}