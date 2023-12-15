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

  Future<dynamic> createUser(var userData) async {
    dio.Response response =
        await dioInstance.post(URL + 'register', data: userData);

    return response;
  }

  Future<dynamic> login(nipd, password) async {
    final formData = dio.FormData.fromMap({
      'nipd': nipd,
      'password': password,
    });

    dio.Response response =
        await dioInstance.post(URL + 'login', data: formData);

    return response;
  }

  void setUserData(String id, String nama, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userID", id);
    await prefs.setString("nama", nama);
    await prefs.setString("email", email);
  }
}
