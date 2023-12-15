import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            Text(controller.data['id']),
            // Text(controller.data['Nama']),
            // Text(controller.data['NIPD']),
            // Text(controller.data['PT']),
            // Text(controller.data['Prodi']),
            // Text(controller.data['Email']),
            // Text(controller.data['Password']),
            TextButton(
              onPressed: () => Get.offNamed('/login'),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
