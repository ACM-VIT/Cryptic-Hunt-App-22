import 'package:cryptic_hunt/data/announcement.dart';
import 'package:cryptic_hunt/data/timeline_object.dart';
import 'package:get_it/get_it.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:dio/dio.dart';

import '../data/rule.dart';

class AnnouncementService {
  AnnouncementService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;

  Future<List<Announcement>?> getAnnouncements({
    String endpoint = "/meta/updates",
  }) async {
    try {
      // List<Announcement> announcements = [
      //   Announcement("This is A description", DateTime.now().toIso8601String(),
      //       "Announcement")
      // ];
      // return announcements;
      Response response = await dio.get(
        endpoint,
      );
      print(response.data);
      if (response.statusCode == 200) {
        List<Announcement> announcements = (response.data)
            .map<Announcement>((i) => Announcement.fromJson(i))
            .toList();
        return announcements;
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_QUESTION_GROUP] ${de.response} \n ${de.requestOptions.headers}");
      rethrow;
    }
  }
}
