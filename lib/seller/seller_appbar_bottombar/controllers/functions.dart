import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SellerData?> fetchSellerDetails()async{
  final sharedPref=await SharedPreferences.getInstance();
  dynamic id= sharedPref.getString('sellerId');
  dynamic companyName= sharedPref.getString('sellerCompanyName');
  dynamic location= sharedPref.getString('sellerLocation');
  dynamic mobile= sharedPref.getString('sellerMobile');
  return SellerData(id: id, companyName: companyName, location: location, mobile: mobile);
}