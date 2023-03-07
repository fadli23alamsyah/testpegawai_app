import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/routes/routes.dart';
import 'package:pegawaiediites_app/services/shared_preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.getInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pegawai PT. EDII App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initialRoute,
      getPages: Routes.getRoutes,
    );
  }
}