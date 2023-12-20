import 'package:campuss_life/app/data/models/userModel.dart';
import 'package:campuss_life/app/data/providers/firestore_db.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  final URL = "https://campuss-life-backend-acron3.vercel.app/";
  dio.Dio dioInstance = dio.Dio();

  Future<dynamic> getPDDIKTI(var nipd, var univ) async {
    dio.Response response =
        await dioInstance.get(URL + 'getPDDIKTI/${nipd}/${univ}');

    return response;
  }

  Future<dynamic> createUser(UserModel userData, String password) async {
    var response = await FirestoreDb.registerUser(userData, password);
    if (response.runtimeType != String) {
      setUserData(response['id'], response['nama'], response['email']);
    }
    return response;
  }

  Future<dynamic> login(nipd, password) async {
    var user = await FirestoreDb.login(nipd, password);
    if (user.runtimeType != String) {
      print(user['data']['Nama']);
      setUserData(
        user['cred'].uid,
        user['data']['Nama'],
        user['data']['Email'],
      );
    }
    return user;
  }

  void setUserData(String id, String nama, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userID", id);
    await prefs.setString("nama", nama);
    await prefs.setString("email", email);
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirestoreDb.logout();
    await prefs.clear();
  }
}
