import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserData?> fetchUserDetails()async{
  final sharedPref=await SharedPreferences.getInstance();
  dynamic id= sharedPref.getString('id');
  dynamic email= sharedPref.getString('email');
  dynamic userName= sharedPref.getString('userName');
  print(id);
  print(email);
  print(userName);
  return UserData(id: id, email: email, userName: userName);
}