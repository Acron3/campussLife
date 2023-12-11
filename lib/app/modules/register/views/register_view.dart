import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'RegisterView is working',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/login'),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
