// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:campuss_life/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 200,
                  ),
                  Text(
                    "Welcome Back to Campuss Life",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nomor Induk Mahasiswa",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: controller.nipdController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: controller.isNipdValid.value
                                ? null
                                : "Nomor Induk Tidak Valid",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          obscureText: true,
                          controller: controller.passController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.errorTxt.value,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            onPressed: () {
                              if (controller.validate()) {
                                controller.login();
                              }
                            },
                            child: Text(
                              "Sign In Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.REGISTER);
                          },
                          child: Center(
                            child: Text(
                              "Create New Account",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
