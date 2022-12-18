import 'dart:convert';
import 'package:http/http.dart';
import 'package:ictus/connection/dtos/ExecuteDTO.dart';

import 'dtos/user.dart';

class BackendAPIService {
  final String host = "http://192.168.43.16:9999";

  Future<ExecuteDTO> getECGbyUserID(String id, String beforeDate) async {
    print(id);
    Uri uriListExecutions = Uri.parse(host + "/ecg/" + id + "/list/?beforeDate=" + beforeDate);
    print(uriListExecutions);
    final response = await get(uriListExecutions);
    List<String> ecgList = [];
    if (response.statusCode == 200) {
      jsonDecode(response.body).forEach((element) {
        ecgList.add(element);
      });
    } else {
      throw Exception('Failed to send id');
    }
    Uri uriExecute = Uri.parse(host + ecgList[0]);
    print(uriExecute);
    final responseExecute = await get(uriExecute);
    ExecuteDTO dto = ExecuteDTO.fromJson(jsonDecode(responseExecute.body));
    return dto;
  }

  Future<bool> checkUser(String id, String password) async {
    Uri uri = Uri.parse(host + "/login/");
    final response = await post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'id': id,
          'password': password,
        }));
    print(id);
    print(password);
    print(response.body);
    if (response.statusCode == 200) {
      bool res = jsonDecode(response.body);
      return res;
    } else {
      /*print(response.statusCode);
      return false;*/
      throw Exception('Failed to login');
    }
  }
}
