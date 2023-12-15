import 'package:campuss_life/app/data/services/services.dart';
import 'package:campuss_life/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  UserService service = UserService();
  RxString NIPDerrorText = 'Nomor Induk Tidak Valid'.obs;
  RxString UNIVerrorText = 'Nama Universitas Tidak Valid'.obs;
  RxString ButtonTxt = 'Lanjutkan'.obs;
  TextEditingController nimController = TextEditingController();
  TextEditingController univController = TextEditingController();

  final isUnivValid = true.obs;
  final isNimValid = true.obs;

  final count = 0.obs;
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
    this.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void validate() {
    isNimValid.value = nimController.text.isNotEmpty;
    isUnivValid.value = univController.text.isNotEmpty;
  }

  void fetchData() async {
    var nipd = nimController.text;
    var univ = univController.text.replaceAll(" ", "%20").toLowerCase();
    try {
      ButtonTxt.value = 'Loading...';
      var response = await service.getPDDIKTI(nipd, univ);
      if (response.statusCode == 200) {
        ButtonTxt.value = 'Lanjutkan';
        Get.toNamed(Routes.REGISTER_STEP2, arguments: [
          {"data": response.data, "status": response.statusCode}
        ]);
      }
    } catch (e) {
      ButtonTxt.value = 'Lanjutkan';
      isNimValid.value = false;
      NIPDerrorText.value = 'Terjadi Kesalahan / Data Tidak Ditemukan';
      isUnivValid.value = false;
      UNIVerrorText.value = 'Terjadi Kesalahan / Data Tidak Ditemukan';
      print(e);
    }
  }
}
