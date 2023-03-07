import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        physics: const ClampingScrollPhysics(),
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
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'No. KTP',
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
                labelText: 'Jenis Kelamin',
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
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
