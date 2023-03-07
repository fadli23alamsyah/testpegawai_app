import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';

class HomeController extends GetxController{

  var user = SharedPrefModel().obs;

  @override
  void onInit() {
    super.onInit();
    user.value = SharedPreferenceService.getSharedPref()!;
  }

  void logoutClick(){
    SharedPreferenceService.removeSharedPref();
    Get.offNamed(RouteName.loginScreen);
  }
  
}