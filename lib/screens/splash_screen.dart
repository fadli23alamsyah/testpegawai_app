import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Image.asset(
                'assets/edii_logo.jfif',
                scale: 1.5,
              ),
            ),
            const Text('Created with ❤ by Palpal'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
