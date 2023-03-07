import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawaiediites_app/controllers/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang,',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    color: Colors.blue,
                  ),
                ),
                const Text('Calon user baru'),
                Card(
                  margin: const EdgeInsets.only(top: 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                        right: 10,
                        bottom: 20,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.blue, width: 8),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Haloo...!',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Nama',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onChanged: (val) => controller.userRequest.value.name = val,
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
                            onChanged: (val) => controller.userRequest.value.email = val,
                          ),
                          const SizedBox(height: 8),
                          Obx(() => TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: controller.hidePass.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () => controller.passwordClick() ,
                                  icon: Icon(controller.hidePass.value ? Icons.visibility : Icons.visibility_off),
                                ),
                              ),
                              onChanged: (val) => controller.userRequest.value.password = val,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.registerClick(),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 45, right: 40),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30))),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sudah punya akun ?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.loginClick(),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.redAccent,
                          letterSpacing: 3,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
