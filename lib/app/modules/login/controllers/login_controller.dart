import 'package:campuss_life/app/data/services/services.dart';
import 'package:campuss_life/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController nipdController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final isNipdValid = true.obs;
  final isPassValid = true.obs;
  final ButtonTxt = 'Sign In Now'.obs;
  final errorTxt = ''.obs;

  @override
  void onInit() {
    // redirect();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nipdController.dispose();
    passController.dispose();
    super.onClose();
  }

  void redirect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("userID")) {
      Get.offNamed(Routes.HOME, arguments: prefs.get("userID"));
    }
  }

  void login() async {
    UserService service = UserService();
    try {
      ButtonTxt.value = 'Loading...';
      var response =
          await service.login(nipdController.text, passController.text);
      if (response.statusCode == 200) {
        ButtonTxt.value = 'Sign In Now';
        if (response.data['error'] != null) {
          isNipdValid.value = false;
          isPassValid.value = false;
          errorTxt.value = response.data['error']
              .toString()
              .replaceAll('NIPD', "Nomor Induk");
        } else {
          service.setUserData(response.data['id'], response.data['nama'],
              response.data['email']);
          Get.offAllNamed(Routes.HOME);
        }
      }
    } catch (e) {
      ButtonTxt.value = 'Sign In Now';
      print(e);
    }
  }

  bool validate() {
    isNipdValid.value = nipdController.text.isNotEmpty;
    isPassValid.value = passController.text.isNotEmpty;
    return (isNipdValid.value && isPassValid.value);
  }
}
