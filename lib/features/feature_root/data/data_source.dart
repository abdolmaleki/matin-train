import 'package:team_project/core/utils/constants/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootDatasource {
  Future<void> saveAppLanguage(String language) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SharedPreferencesKey.appLanguage, language);
    return;
  }

  Future<String> getAppLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(SharedPreferencesKey.appLanguage)!;
  }
}
