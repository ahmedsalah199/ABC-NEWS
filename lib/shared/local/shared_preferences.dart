import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
   static SharedPreferences? sharedPreferences ;
  static init () async {
    sharedPreferences =  await SharedPreferences.getInstance();
  }

 static Future putData ({required bool isLight}) async {
    return await sharedPreferences!.setBool("isLight", isLight);
  }
   static bool? getData ()  {
     return  sharedPreferences!.getBool("isLight") ?? true ;
   }

}