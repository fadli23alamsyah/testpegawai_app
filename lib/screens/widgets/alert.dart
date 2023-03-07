import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customAlert(String message){
  Get.defaultDialog(
    barrierDismissible: true,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}