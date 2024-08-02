import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

const String stripePublishableKey = 'pk_test_51PeCtkJKQ0ZhTvhb3fJaXwajZVZC804zK8BkfDgdOAlBBBXWy8W02QVWzp9zDYhVuIvKsj7lOUT4sLIOTLKe1smn00UYblbtRp';
const String stripeSecretKey = 'sk_test_51PeCtkJKQ0ZhTvhbpXmz2vTVQ6JNeeQmnWt89hWP27swajFcwXgYNLVLSlKaO3k8ouAQ8ReG2BrysaOi0tF1KJ5u0056EXjJUP';


class StripePaymentService{
  StripePaymentService._();

  static final StripePaymentService instance = StripePaymentService._();

  Future<void> makePayment()async{
    try{
      String? paymentIntentClientSecret = await createPaymentIntent(10, 'USD');
      if(paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Auto Mates'
      ));
      await processPayment();
    }
    catch (e){
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String?> createPaymentIntent(int amount,String currency)async{
    try{
      final Dio dio = Dio();
      Map<String,dynamic> data = {
        'amount' : calculateAmount(amount),
        'currency' : currency,
      };
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization":"Bearer $stripeSecretKey",
            "Content-Type":'application/x-www-form-ur-lencoded'
          },
        )
      );
      if(response.data != null){
        return response.data['client_secret'];
      }
      return null;
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  String calculateAmount(int amount){
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }

  Future<void> processPayment()async{
    try{
      await Stripe.instance.presentPaymentSheet();
    }catch (e){
      if(kDebugMode){
        print(e);
      }
    }
  }
}