import 'package:shared_preferences/shared_preferences.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/user.dart';

class Preference{
  static String prefINTRO = "TERANG_INTRO";
  static String prefUSER = "TERANG_USER";
}

skipIntro() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(Preference.prefINTRO) ?? false;
}

introFinish() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(Preference.prefINTRO, true);
}

saveSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(Preference.prefUSER, currentUser.toString());
}

loadSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey(Preference.prefUSER)) {
    currentUser = User.fromStringJson(prefs.getString(Preference.prefUSER));
    return true;
  } else
    return false;
}

destroySession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(Preference.prefUSER);
}