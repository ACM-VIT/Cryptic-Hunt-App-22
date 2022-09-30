import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cryptic_hunt/data/user.dart' as profile;
import 'package:cryptic_hunt/networking/profile_service.dart';

enum HomePageState {
  loggedOut,
  loggedIn,
  notInTeam,
  onBoardingScreen,
}

class HomePageNotifier extends ChangeNotifier {
  late GAuthService auth;
  late ProfileService profileService;
  HomePageState state = HomePageState.onBoardingScreen;
  bool busy = false;

  HomePageNotifier() {
    auth = GetIt.I<GAuthService>();
    profileService = GetIt.I<ProfileService>();
    auth.authState().listen((User? user) async {
      if (user == null) {
        if (state != HomePageState.onBoardingScreen) {
          state = HomePageState.onBoardingScreen;
          notifyListeners();
        }
      } else {
        //profile.User? profileUser = profileService.getUser();
        isBusy(true);
        profile.User? profileUser = await profileService.getUserDetails();
        isBusy(false);
        if (profileUser == null) await auth.logout();
        if (profileUser != null && profileUser.teamId == null) {
          state = HomePageState.notInTeam;
          notifyListeners();
        } else if (profileUser != null &&
            profileUser.teamId != null &&
            state != HomePageState.loggedIn) {
          state = HomePageState.loggedIn;
          notifyListeners();
        }

        SharedPreferences pref = await SharedPreferences.getInstance();
        String token;
        try {
          token = await user.getIdToken();
        } catch (e) {
          token = "";
        }

        pref.setString('tokenId', token);
      }
      FlutterNativeSplash.remove();
    });
  }

  void changeState(HomePageState state) {
    if (this.state != state) {
      this.state = state;
      notifyListeners();
    }
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
