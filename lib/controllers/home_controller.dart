import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/services/employee_service.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';

class HomeController extends GetxController{
  late EmployeeService _employeeService;

  var user = SharedPrefModel().obs;
  var status = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.value = SharedPreferenceService.getSharedPref()!;
    _employeeService = EmployeeService();
  }

  @override
  void onReady() async {
    super.onReady();
    final employee = await _employeeService.getEmployeeByEmail(user.value.email!);
    status.value = (user.value.role == 'admin') ? true  : employee?.isActive ?? false;
  }

  void logoutClick(){
    SharedPreferenceService.removeSharedPref();
    Get.offNamed(RouteName.loginScreen);
  }
  
  void updateClick(){
    Get.toNamed(RouteName.updateProfileScreen)?.then((value) => user.value = SharedPreferenceService.getSharedPref()!);
  }
}