import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/EnoticeDataModel.dart';
import '../model/HomeworkDataModel.dart';
import '../model/RandomUserDataModel.dart';

class UserApi {
  static Future<RandomUserDataModel?> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);

    try {
      if (response.statusCode == 200) {
        var responseData =
            RandomUserDataModel.fromJson(jsonDecode(response.body));
        return responseData;
      }
    } catch (e) {
      print("Catch block");
      print(e);
    }
  }

  static Future<List<EnoticeDatum>> fetchEnotice() async {
    const url =
        'https://demo.futuretechschool.in/app_api/enotice/data_enotice.php';
    Map<String, dynamic> paramBody = {
      "student_reg_id": "2242",
      "branch_id": "2",
      "institution_id": "26",
      "from_date": "2023-05-01",
      "to_date": "2023-08-01",
    };
    final uri = Uri.parse(url).replace(queryParameters: paramBody);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    List<EnoticeDatum> enoticeData = [];
    try {
      if (response.statusCode == 200) {
        var responseData = EnoticeDataModel.fromJson(jsonDecode(response.body));
        enoticeData = responseData.data!;
        return enoticeData;
      }
    } catch (e) {
      print("Catch block");
      print(e);
    }
    return enoticeData;
  }

  static Future<List<HomeworkDatum>> fetchHomework() async {
    const url =
        'https://demo.futuretechschool.in/app_api/home_work/data_home_work.php';
    Map<String, dynamic> paramBody = {
      "student_reg_id": "2242",
      "branch_id": "2",
      "institution_id": "26",
      "from_date": "2023-05-01",
      "to_date": "2023-08-01",
    };
    final uri = Uri.parse(url).replace(queryParameters: paramBody);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    List<HomeworkDatum> enoticeData = [];
    try {
      if (response.statusCode == 200) {
        var responseData =
            HomeworkDataModel.fromJson(jsonDecode(response.body));
        enoticeData = responseData.data!;
        return enoticeData;
      }
    } catch (e) {
      print("Catch block");
      print(e);
    }
    return enoticeData;
  }

  static Future<bool> createUserApi(
      {required String title,
      required String body,
      required String userId}) async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    Map<String, dynamic> bodyData = {
      "title": title,
      "body": body,
      "userId": userId,
    };
    final uri = Uri.parse(url);

    try {
      final response = await http.post(uri, body: bodyData);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print("Catch block");
      print(e);
    }
    return false;
  }
}
