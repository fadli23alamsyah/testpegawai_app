import 'package:flutter/material.dart';

class DetailsEmployee extends StatelessWidget {
  const DetailsEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pegawai'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Nama',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Tempat, Tanggal Lahir',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Jabatan',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Status Pegawai',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            DropdownButtonFormField(
              value: false,
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
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Update Pegawai',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
