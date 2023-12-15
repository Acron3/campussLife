import 'package:campuss_life/app/data/models/userModel.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  final url = 'http://127.0.0.1:8080';
  Future<UserProvider> init() async {
    return this;
  }

  Future<UserModel> getUser(String nipd, String univ) async {
    final response = await get('$url/register/$nipd/$univ');
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> postUser(UserModel data) async {
    final response = await post('$url/register', data.toJson());
    return UserModel.fromJson(response.body);
  }
}
