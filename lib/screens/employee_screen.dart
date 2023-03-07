import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pegawaiediites_app/screens/details_employee.dart';
import 'package:pegawaiediites_app/screens/widgets/item_employee.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pegawai'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ItemEmployee(onClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsEmployee()))),
          ItemEmployee(onClick: (){debugPrint('object2');}),
        ],
      ),
    );
  }
}
