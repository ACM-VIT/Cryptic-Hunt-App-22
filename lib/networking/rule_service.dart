import 'package:cryptic_hunt/data/timeline_object.dart';
import 'package:get_it/get_it.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:dio/dio.dart';

import '../data/rule.dart';

class RuleService {
  RuleService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;

  Future<List<Rule>?> getRules({
    String endpoint = "/meta/timeline",
  }) async {
    try {
      List<Rule> rules = [
        Rule("No Cheating is allowed"),
        Rule("No Cheating is allowed"),
        Rule(
            "this is a test for a big rule. I hope my ui will not break. I hope ACM will offer me free pizza and kfc for all the work i did. Also STC is OP "),
        Rule("No Cheating is allowed"),
      ];
      return rules;
      // Response response = await dio.get(
      //   endpoint,
      // );
      // print(response.data);
      // if (response.statusCode == 200) {
      //   List<Rule> rules = (response.data)
      //       .map<Rule>((i) => TimelineObject.fromJson(i))
      //       .toList();
      //   return rules;
      // }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_QUESTION_GROUP] ${de.response} \n ${de.requestOptions.headers}");
      rethrow;
    }
  }
}
