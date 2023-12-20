import 'dart:developer';
import 'package:campuss_life/app/data/services/services.dart';
import 'package:campuss_life/app/data/models/userModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() async {
    UserService service = UserService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    service.logout();
  }
}
