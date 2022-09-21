import 'package:flutter/cupertino.dart';
import '../modelData/joinTeam.dart';
import '../networking/dio_service.dart';

class JoinTeamProvider with ChangeNotifier {
  JoinTeam? _JoinTeam = null;
  final DioService dioService = DioService();
  bool loading = false;
  getJoinTeamData(String teamcode) async {
    loading = true;
    _JoinTeam = await dioService.joinTeam(teamcode);
    loading = false;
    notifyListeners();
  }

  String? getTeamName() {
    return _JoinTeam?.name;
  }
}
