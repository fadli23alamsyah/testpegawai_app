import 'package:pegawaiediites_app/models/employee_model.dart';
import 'package:pegawaiediites_app/repositories/employee_repository.dart';

class EmployeeService {

  Future<EmployeeModel?> getEmployeeByEmail(String email) async{
    try{
      final employee = await EmployeeRepository().findEmployeeByEmail(email);
      return employee;
    }catch(error){
      return null;
    }
  }

  Future<bool> updateEmployee(EmployeeModel employee) async{
    try{
      await EmployeeRepository().update(employee);
      return true;
    }catch(error){
      return false;
    }
  }
}