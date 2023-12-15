import 'package:get/get.dart';

class RxUserModel {
  final id = ''.obs;
  final nama = ''.obs;
  final nipd = ''.obs;
  final pt = ''.obs;
  final prodi = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
}

class UserModel {
  UserModel({nama, nipd, pt, prodi});

  final rx = RxUserModel();

  get id => rx.id.value;
  set id(value) => rx.id.value = value;

  get nama => rx.nama.value;
  set nama(value) => rx.nama.value = value;

  get nipd => rx.nipd.value;
  set nipd(value) => rx.nipd.value = value;

  get pt => rx.pt.value;
  set pt(value) => rx.pt.value = value;

  get prodi => rx.prodi.value;
  set prodi(value) => rx.prodi.value = value;

  get email => rx.email.value;
  set email(value) => rx.email.value = value;

  get password => rx.password.value;
  set password(value) => rx.password.value = value;

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nama = json['Nama'];
    this.nipd = json['NIPD'];
    this.pt = json['PT'];
    this.prodi = json['Prodi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama'] = this.nama;
    data['NIPD'] = this.nipd;
    data['PT'] = this.pt;
    data['Prodi'] = this.prodi;
    data['Email'] = this.email;
    data['Password'] = this.password;
    return data;
  }
}
