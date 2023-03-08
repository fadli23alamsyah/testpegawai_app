import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/controllers/employee_controller.dart';

class FormEmployeeScreen extends StatelessWidget {
  const FormEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EmployeeController>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Pegawai'),
          actions: [
            controller.employeeRequest.id != null 
            ? IconButton(
              onPressed: () => controller.deleteClick(),
              icon: const Icon(Icons.delete, color: Colors.red),
            )
            : Container() 
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: controller.employeeRequest.name,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onChanged: (val) => controller.employeeRequest.name = val,
              ),
              TextFormField(
                initialValue: controller.employeeRequest.birth,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Tempat, Tanggal Lahir',
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onChanged: (val) => controller.employeeRequest.birth = val,
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: controller.employeeRequest.position,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Jabatan',
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onChanged: (val) => controller.employeeRequest.position = val,
              ),
              const SizedBox(height: 20),
              const Text(
                'Status Pegawai',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              DropdownButtonFormField(
                value: controller.employeeRequest.isActive,
                items: const [
                  DropdownMenuItem(
                    value: true,
                    child: Text('Aktif'),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text('Tidak Aktif'),
                  ),
                ],
                onChanged: (val) => controller.employeeRequest.isActive = val,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.saveClick(),
                  child: const Text(
                    'Simpan Pegawai',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
