import 'package:course/cache/cache.dart';
import 'package:course/services/api.dart';

Future userAuth(String email, String password) async {
  Map data = {'email': email, 'password': password};
  try {
    var response = await dio.post(
      'login',
      data: data,
    );
    print(response.data['token']);
    String token = response.data['token'];
    int userId = response.data['user_id'];
    String userRole = response.data['role'];
    AppCache.setToken(token);
    AppCache.setUserId(userId);
    AppCache.setUserRole(userRole);
  } catch (error) {
    print(error);
  }
}

Future userRegister(
  String email,
  String password,
  String name,
  String userRole,
) async {
  Map data = {
    'email': email,
    'password': password,
    'name': name,
    'role': userRole
  };
  try {
    await dio.post(
      'register',
      data: data,
    );
    return true;
  } catch (error) {
    print(error);
    return false;
  }
}
