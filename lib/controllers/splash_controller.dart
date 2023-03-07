import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    _redirect();
  }

  Future _redirect() async{
    await const Duration(seconds: 4).delay();
    final SharedPrefModel? data = SharedPreferenceService.getSharedPref();
    if(data == null){
      Get.offNamed(RouteName.loginScreen);
    }else{
      Get.offNamed(RouteName.homeScreen);
    }
  }

}