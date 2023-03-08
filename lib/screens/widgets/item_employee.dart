import 'package:flutter/material.dart';
import 'package:pegawaiediites_app/models/employee_model.dart';

class ItemEmployee extends StatelessWidget {
  const ItemEmployee({super.key, required this.employee, required this.onClick});

  final Function onClick;
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.name!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Status ${employee.isActive! ? "Aktif" : "Tidak Aktif"}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}