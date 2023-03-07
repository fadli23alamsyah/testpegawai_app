import 'package:flutter/material.dart';

class ItemEmployee extends StatelessWidget {
  const ItemEmployee({super.key, required this.onClick});

  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: const Text(
            'Nama Pegawai',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}