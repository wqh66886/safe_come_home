import 'package:safe_come_home/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> setAuthenticationToken(String token) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString("Authorization", token);
  }

  Future<String> getAuthorizationToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString("Authorization") ?? "";
  }

  Future<bool> isFirstOpen() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(Splash.isFirstOpen) ?? false;
  }

  Future<void> appIsOpen() async {
    final preference = await SharedPreferences.getInstance();
    await preference.setBool(Splash.isFirstOpen, true);
  }
}
