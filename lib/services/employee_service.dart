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

  Future<List<EmployeeModel>> allEmployee() async{
    try{
      return await EmployeeRepository().getAll();
    }catch(error){
      return [];
    }
  }

  Future<bool> deleteEmployee(String id) async{
    try{
      await EmployeeRepository().remove(id);
      return true;
    }catch(error){
      return false;
    }
  }

  Future<bool> saveOrUpdate(EmployeeModel employee) async{
    late bool isSuccess;
    if(employee.id != null){
      try{
        isSuccess = await EmployeeRepository().update(employee);
      }catch(error){
        isSuccess = false;
      }
    }else{
      try{
        isSuccess = await EmployeeRepository().save(employee);
      }catch(error){
        isSuccess = false;
      }
    }
    return isSuccess;
  }
}