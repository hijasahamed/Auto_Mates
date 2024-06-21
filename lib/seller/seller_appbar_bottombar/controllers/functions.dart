import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SellerData?> fetchSellerDetails()async{
  final sharedPref=await SharedPreferences.getInstance();
  dynamic id= sharedPref.getString('sellerId');
  dynamic sellerProfile= sharedPref.getString('sellerProfile');
  dynamic companyName= sharedPref.getString('sellerCompanyName');
  dynamic location= sharedPref.getString('sellerLocation');
  dynamic mobile= sharedPref.getString('sellerMobile');
  return SellerData(sellerProfile: sellerProfile,id: id, companyName: companyName, location: location, mobile: mobile);
}