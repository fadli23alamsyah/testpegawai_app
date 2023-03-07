import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/user_login_request.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/screens/widgets/alert.dart';
import 'package:pegawaiediites_app/screens/widgets/loading.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';
import 'package:pegawaiediites_app/services/user_service.dart';

class LoginController extends GetxController {
  late UserService _userService;

  var showPass = false.obs;
  var userRequest = UserLoginRequest().obs;

  @override
  void onInit() {
    super.onInit();
    _userService = UserService();
  }

  void passwordClick(){
    showPass.value = !showPass.value;
  }

  void registerClick(){
    FocusManager.instance.primaryFocus!.unfocus();
    Get.toNamed(RouteName.registerScreen);
  }

  Future loginClick() async{
    FocusManager.instance.primaryFocus!.unfocus();
    customLoading();
    if(userRequest.value.email != null && userRequest.value.password != null){
      final user = await _userService.login(userRequest.value).whenComplete(() => Get.back());
      if(user != null){
        SharedPreferenceService.setSharedPref(user);
        Get.offNamed(RouteName.homeScreen);
      }else{
        customAlert('Periksa kembali email dan password anda!!');
      }
    }else{
      customAlert('Input harus terisi!!');
    }
  }
}