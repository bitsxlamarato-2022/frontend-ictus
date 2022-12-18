import 'dart:convert';
import 'package:http/http.dart';

import 'dtos/user.dart';

class BackendAPIService {
  final String host = "http://192.168.43.252:8000";

  Future<UserDTO> getECGbyUserID(String id) async {
    print(id);
    Uri uri = Uri.parse(host + "/users/" + id);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return UserDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to send id');
    }
  }

  Future<bool> checkUser(String id, String password) async {
    Uri uri = Uri.parse(host + "/login" + id + password);
    final response = await get(uri);
    if (response.statusCode == 200) {
      UserDTO user = UserDTO.fromJson(jsonDecode(response.body));
      if (user.password == password) {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to login');
    }
  }
}