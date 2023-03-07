import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customLoading(){
  Get.defaultDialog(
    title: '',
    barrierDismissible: false,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        CircularProgressIndicator(
          color: Colors.amber,
          strokeWidth: 6,
        ),
        SizedBox(height: 10),
        Text(
          'Loading...',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}