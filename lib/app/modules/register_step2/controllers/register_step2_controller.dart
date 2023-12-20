import 'package:campuss_life/app/data/models/userModel.dart';
import 'package:campuss_life/app/data/services/services.dart';
import 'package:campuss_life/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStep2Controller extends GetxController {
  final argumentData = Get.arguments;
  UserModel userModel = UserModel();
  RxString ButtonTxt = 'Daftar'.obs;
  RxString NipdError = ''.obs;
  RxString ErrorTxt = ''.obs;

  TextEditingController namaController = TextEditingController();
  TextEditingController nipdController = TextEditingController();
  TextEditingController univController = TextEditingController();
  TextEditingController prodiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  final isEmailValid = true.obs;
  final isPassValid = true.obs;
  final isConfPassValid = true.obs;
  final isNipdValid = true.obs;
  final isAppValid = true.obs;
  final isUnivValid = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    print(argumentData[0]['data']);
    namaController.text = argumentData[0]["data"]["Nama"];
    nipdController.text = argumentData[0]["data"]["NIPD"].toString();
    univController.text = argumentData[0]["data"]["PT"];
    prodiController.text = argumentData[0]["data"]["Prodi"];
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

  void increment() => count.value++;

  bool validate() {
    isEmailValid.value = emailController.text.isNotEmpty;
    isPassValid.value = passController.text.isNotEmpty;
    isConfPassValid.value = confPassController.text.isNotEmpty &&
        passController.text == confPassController.text;
    return (isEmailValid.value && isPassValid.value && isConfPassValid.value);
  }

  void registerUser() async {
    UserService service = UserService();

    userModel.nama = namaController.text;
    userModel.nipd = nipdController.text;
    userModel.pt = univController.text;
    userModel.prodi = prodiController.text;
    userModel.email = emailController.text;
    try {
      ButtonTxt.value = 'Loading...';
      print(userModel.toJson());
      var res = await service.createUser(userModel, passController.text);

      if (res.runtimeType == String) {
        throw Exception(res);
      }

      Future.delayed(Duration(milliseconds: 2000), () {
        ButtonTxt.value = 'Daftar';
        Get.offAllNamed(Routes.HOME);
      });
    } catch (e) {
      ButtonTxt.value = 'Daftar';
      isAppValid.value = false;
      ErrorTxt.value = e.toString();
    }
  }
}
