import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/employee_model.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/screens/widgets/alert.dart';
import 'package:pegawaiediites_app/screens/widgets/loading.dart';
import 'package:pegawaiediites_app/services/employee_service.dart';

class EmployeeController extends GetxController {
  late EmployeeService _employeeService;

  var listEmployee = List<EmployeeModel>.empty().obs;
  var employeeRequest = EmployeeModel();

  @override
  void onInit() async {
    super.onInit();
    _employeeService = EmployeeService();
    listEmployee.value = await _employeeService.allEmployee();
  }

  void addClick(){
    employeeRequest = EmployeeModel();
    Get.toNamed(RouteName.formEmployeeScreen)?.then((value) async{
      listEmployee.value = await _employeeService.allEmployee();
    });
  }

  void employeeClick(EmployeeModel employee){
    employeeRequest = employee;
    Get.toNamed(RouteName.formEmployeeScreen)?.then((value) async{
      listEmployee.value = await _employeeService.allEmployee();
    });
  }

  Future deleteClick() async{
    FocusManager.instance.primaryFocus!.unfocus();
    Get.dialog(
      AlertDialog(
        title: const Text('Peringatan'),
        content: Text('Yakin ingin menghapus ${employeeRequest.name}'),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text('Ok', style: TextStyle(color: Colors.red)),
            onPressed: () async{
              Get.back();
              customLoading();
              final response = await _employeeService.deleteEmployee(employeeRequest.id!).whenComplete(() => Get.back());
              if(response){
                Get.back();
              }else{
                customAlert('Terjadi error pada proses penginputan!!');
              }
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future saveClick() async{
    FocusManager.instance.primaryFocus!.unfocus();
    customLoading();
    if(employeeRequest.name != null && employeeRequest.birth != null && employeeRequest.position != null){
      final response = await _employeeService.saveOrUpdate(employeeRequest).whenComplete(() => Get.back());
      if(response){
        Get.back();
      }else{
        customAlert('Terjadi error pada proses penginputan!!');
      }
    }else{
      Get.back();
      customAlert('Input harus terisi!!');
    }
  }
}