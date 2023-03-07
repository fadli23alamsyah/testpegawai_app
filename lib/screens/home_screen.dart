import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/controllers/home_controller.dart';
import 'package:pegawaiediites_app/screens/employee_screen.dart';
import 'package:pegawaiediites_app/screens/update_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 18, top: kToolbarHeight),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Halo, \n',
                        ),
                        TextSpan(
                          text: controller.user.value.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white60,
                        width: 2,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                controller.user.value.role == 'admin' 
                ? ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmployeeScreen())),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.people, size: 30),
                      Text('Pegawai')
                    ],
                  ),
                )
                : ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfile())),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.edit_note, size: 30),
                      Text('Update')
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => controller.logoutClick(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.logout, size: 30),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
