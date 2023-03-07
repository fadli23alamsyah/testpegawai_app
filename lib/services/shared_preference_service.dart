import 'package:pegawaiediites_app/models/sharedpref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static late SharedPreferences sharedPreferences;
  
  static Future getInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void setSharedPref(SharedPrefModel sharedPref){
    sharedPreferences.setString('name', sharedPref.name!);
    sharedPreferences.setString('email', sharedPref.email!);
    sharedPreferences.setString('role', sharedPref.role!);
  }

  SharedPrefModel? getSharedPref(){
    if(sharedPreferences.getString('email') != null){
      return SharedPrefModel(
        name: sharedPreferences.getString('name'),
        email: sharedPreferences.getString('email'),
        role: sharedPreferences.getString('role'),
      );
    }

    return null;
  }

  void removeSharedPref(){
    sharedPreferences.remove('name');
    sharedPreferences.remove('email');
    sharedPreferences.remove('role');
  }
}