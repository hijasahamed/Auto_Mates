import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserData?> fetchUserDetails()async{
  final sharedPref=await SharedPreferences.getInstance();
  dynamic id= sharedPref.getString('id');
  dynamic email= sharedPref.getString('email');
  dynamic userName= sharedPref.getString('userName');
  dynamic location= sharedPref.getString('location');
  dynamic mobile= sharedPref.getString('mobile');
  print(id);
  print(email);
  print(userName);
  print(location);
  print(mobile);
  return UserData(id: id, email: email, userName: userName,location: location,mobile: mobile);
}