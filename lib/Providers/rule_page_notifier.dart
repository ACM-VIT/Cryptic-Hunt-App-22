import 'package:cryptic_hunt/data/rule.dart';
import 'package:cryptic_hunt/data/timeline_object.dart';
import 'package:cryptic_hunt/networking/rule_service.dart';
import 'package:cryptic_hunt/networking/timeline_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class RulePageNotifier extends ChangeNotifier {
  bool busy = false;
  List<Rule> rules = [];
  late RuleService api;

  RulePageNotifier() {
    api = GetIt.I<RuleService>();
  }

  Future<void> getRules({bool showLoading = true}) async {
    if (busy) return;
    try {
      isBusy(true && showLoading);
      rules = await api.getRules() ?? [];
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
