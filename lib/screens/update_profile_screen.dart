import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Profile'),
          actions: [
            IconButton(
              onPressed: () => controller.updateClick(),
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const ClampingScrollPhysics(),
          child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  key: UniqueKey(),
                  initialValue: controller.employeeRequest.value.name,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.name = val,
                ),
                TextFormField(
                  key: UniqueKey(),
                  enabled: false,
                  initialValue: controller.employeeRequest.value.email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.email = val,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: UniqueKey(),
                  initialValue: controller.employeeRequest.value.ktp.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'No. KTP',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.ktp = int.tryParse(val),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: UniqueKey(),
                  initialValue: controller.employeeRequest.value.birth,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Tempat, Tanggal Lahir',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.birth = val,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: UniqueKey(),
                  initialValue: controller.employeeRequest.value.gender,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kelamin',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.gender = val,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: UniqueKey(),
                  initialValue: controller.employeeRequest.value.position,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Jabatan',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.position = val,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: UniqueKey(),
                  initialValue: controller.employeeRequest.value.address,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (val) => controller.employeeRequest.value.address = val,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
