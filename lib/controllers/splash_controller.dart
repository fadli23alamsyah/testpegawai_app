import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';

class SplashController extends GetxController{

  late SharedPreferenceService sharedPrefService;

  @override
  void onInit() {
    super.onInit();
    sharedPrefService = SharedPreferenceService();
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint('tes1');
    _redirect();
  }

  Future _redirect() async{
    await const Duration(seconds: 4).delay();
    final SharedPrefModel? data = sharedPrefService.getSharedPref();
    if(data == null){
      Get.offNamed(RouteName.loginScreen);
      debugPrint('kosong');
    }else{
      Get.offNamed(RouteName.homeScreen);
      debugPrint('ada');
    }
  }

}