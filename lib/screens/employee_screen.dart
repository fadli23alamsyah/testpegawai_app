import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/controllers/employee_controller.dart';
import 'package:pegawaiediites_app/screens/widgets/item_employee.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final controller = Get.put(EmployeeController());

  @override
  void dispose() {
    Get.delete<EmployeeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pegawai'),
        actions: [
          IconButton(
            onPressed: () => controller.addClick(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() => ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: controller.listEmployee.length,
          itemBuilder: (context, index){
            return ItemEmployee(
              onClick: () => controller.employeeClick(controller.listEmployee[index]),
              employee: controller.listEmployee[index],
            );
          }
        ),
      )
    );
  }
}
