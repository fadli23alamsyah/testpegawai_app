import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/models/user_register_request.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/screens/widgets/alert.dart';
import 'package:pegawaiediites_app/screens/widgets/loading.dart';
import 'package:pegawaiediites_app/services/user_service.dart';

class RegisterController extends GetxController {
  late UserService _userService;

  var hidePass = true.obs;
  var userRequest = UserRegisterRequest().obs;

  @override
  void onInit() {
    super.onInit();
    _userService = UserService();
  }

  void passwordClick(){
    hidePass.value = !hidePass.value;
  }

  void loginClick(){
    FocusManager.instance.primaryFocus!.unfocus();
    Get.toNamed(RouteName.loginScreen);
  }

  Future registerClick() async{
    FocusManager.instance.primaryFocus!.unfocus();
    customLoading();
    if(userRequest.value.name != null && userRequest.value.email != null && userRequest.value.password != null){
      await _userService.register(userRequest.value).then((value){
        Get.back();
        customAlert(value);
      });
    }else{
      Get.back();
      customAlert('Input harus terisi!!');
    }
  }
}