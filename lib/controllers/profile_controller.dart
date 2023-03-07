import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/controllers/home_controller.dart';
import 'package:pegawaiediites_app/models/employee_model.dart';
import 'package:pegawaiediites_app/screens/widgets/alert.dart';
import 'package:pegawaiediites_app/screens/widgets/loading.dart';
import 'package:pegawaiediites_app/services/employee_service.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';

class ProfileController extends GetxController{
  late EmployeeService _employeeService;
  final homeC = Get.find<HomeController>();

  var employeeRequest = EmployeeModel().obs;

  @override
  void onInit() async {
    super.onInit();
    _employeeService = EmployeeService();

    final response = await _employeeService.getEmployeeByEmail(homeC.user.value.email!);
    employeeRequest(response);
  }

  Future updateClick() async{
    FocusManager.instance.primaryFocus!.unfocus();
    customLoading();
    if(employeeRequest.value.name != '' && employeeRequest.value.email != '' && 
    employeeRequest.value.ktp.toString() != '' && employeeRequest.value.birth != '' &&
    employeeRequest.value.gender != '' && employeeRequest.value.position != '' && 
    employeeRequest.value.address != ''){
      await _employeeService.updateEmployee(employeeRequest.value).then((value){
        Get.back();
        if(value) {
          homeC.user.value.name = employeeRequest.value.name;
          SharedPreferenceService.setSharedPref(homeC.user.value);
          customAlert('Update berhasil');
        } else {
          customAlert('Periksa inputan anda');
        }
      });
    }else{
      Get.back();
      customAlert('Input harus terisi!!');
    }
  }
}