import 'package:cryptic_hunt/data/announcement.dart';
import 'package:cryptic_hunt/data/rule.dart';
import 'package:cryptic_hunt/data/timeline_object.dart';
import 'package:cryptic_hunt/networking/announcement_service.dart';
import 'package:cryptic_hunt/networking/rule_service.dart';
import 'package:cryptic_hunt/networking/timeline_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class AnnouncementPageNotifier extends ChangeNotifier {
  bool busy = false;
  List<Announcement> announcements = [];
  late AnnouncementService api;

  AnnouncementPageNotifier() {
    api = GetIt.I<AnnouncementService>();
  }

  Future<void> getAnnouncements({bool showLoading = true}) async {
    if (busy) return;
    try {
      isBusy(true && showLoading);
      announcements = await api.getAnnouncements() ?? [];
      if (showLoading == false) notifyListeners();
      isBusy(false);
    } catch (e) {
      isBusy(false);
      rethrow;
    }
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
