import 'package:cryptic_hunt/Providers/google_sign_in_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../modelData/createTeam.dart';
import '../modelData/joinTeam.dart';

class DioService {
  late Dio dio;
  final googleSigninProvider = ChangeNotifierProvider<GoogleSignInProvider>(
      create: (_) => GoogleSignInProvider());
  final baseURL = "http://65.1.18.154:8081";
  String? token;
  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
      ),
    );
    dio.options.headers['Authorization'] = "Bearer $token";
  }

  Future<CreateTeam> createTeam() async {
    const String endpoint = "/teams/createteam";
    late CreateTeam createTeamResult = CreateTeam(
        "id", "name", "teamcode", "teamLeaderId", "createdAt", "updatedAt", 0);
    try {
      final response = await dio.post(
        baseURL + endpoint,
        data: {
          "teamname": "testTeam",
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print(response.data);
        createTeamResult = CreateTeam.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: "Error: ${response.statusCode}");
      }
    } on DioError catch (e) {
      print(e.response);
      createTeamResult.teamcode = e.response!.data['error'].toString();
      return createTeamResult;
    }
    return createTeamResult;
  }

  Future<JoinTeam> joinTeam(String teamcode) async {
    const String endpoint = "/teams/jointeam";
    late JoinTeam joinTeamResult = JoinTeam("id", "email", "name", "picture",
        "gender", "rollNo", "phoneNo", "teamId", "createdAt", "updatedAt");
    Response? response;
    try {
      response = await dio.post(
        baseURL + endpoint,
        data: {
          "teamcode": teamcode,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print(response.data);
        joinTeamResult = JoinTeam.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: "Error: ${response.statusCode}");
      }
    } on DioError catch (e) {
      print(e.response);
      joinTeamResult.name = e.response!.data['error'].toString();
      return joinTeamResult;
    }
    return joinTeamResult;
  }
}
