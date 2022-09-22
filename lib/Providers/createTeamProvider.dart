import 'package:flutter/cupertino.dart';
import '../modelData/createTeam.dart';
import '../networking/dio_service.dart';

class CreateTeamProvider with ChangeNotifier {
  CreateTeam? _createTeam = null;
  final DioService dioService = DioService();
  bool loading = false;
  getCreateTeamData() async {
    loading = true;
    _createTeam = await dioService.createTeam();
    loading = false;
    notifyListeners();
  }

  getTeamCode() {
    if (loading) {
      return -1;
    } else {
      return _createTeam?.teamCode();
    }
  }
}
