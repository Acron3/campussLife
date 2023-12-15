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
    userModel.password = passController.text;
    Map<String, dynamic> data = userModel.toJson();
    try {
      ButtonTxt.value = 'Loading...';
      print(data);
      var response = await service.createUser(data);
      if (response.statusCode == 200) {
        ButtonTxt.value = 'Daftar';
        if (response.data['error'] != null) {
          isNipdValid.value = false;
          NipdError.value = response.data['error']
              .toString()
              .replaceAll('NIPD', "Nomor Induk");
        } else {
          service.setUserData(
              response.data['id'], userModel.nama, userModel.email);
          Get.offAllNamed(Routes.HOME);
        }
      }
    } catch (e) {
      ButtonTxt.value = 'Daftar';
      print(e);
    }
  }
}
