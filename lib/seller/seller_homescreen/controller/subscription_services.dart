import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeSubscriptionService {
  StripeSubscriptionService._();

  static final StripeSubscriptionService instance = StripeSubscriptionService._();

  Future<void> createSubscription({required User user}) async {
    try {
      String? customerId = await createCustomer(user: user);
      if (customerId == null) return;

      String? subscriptionId = await createSubscriptionForCustomer(customerId);
      if (subscriptionId == null) return;

      String? paymentIntentClientSecret = await retrievePaymentIntentForSubscription(subscriptionId);
      if (paymentIntentClientSecret == null) return;

      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Auto Mates'
      ));

      await processPayment();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String?> createCustomer({required User user}) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        'name': user.userName,
        'email': user.email,
      };
      var response = await dio.post(
        'https://api.stripe.com/v1/customers',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
          },
        ),
      );
      if (response.data != null) {
        return response.data['id'];
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<String?> createSubscriptionForCustomer(String customerId) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        'customer': customerId,
        'items': [
          {'plan': 'price_1PiwOIJKQ0ZhTvhbgrsQcPTl'},
        ],
      };
      var response = await dio.post(
        'https://api.stripe.com/v1/subscriptions',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded',
          },
        ),
      );
      if (response.data != null) {
        return response.data['id'];
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating subscription: $e');
        if (e is DioException) {
          print('Response data: ${e.response?.data}');
        }
      }
    }
    return null;
  }

  Future<String?> retrievePaymentIntentForSubscription(String subscriptionId) async {
    try {
      final Dio dio = Dio();
      var response = await dio.get(
        'https://api.stripe.com/v1/subscriptions/$subscriptionId',
        options: Options(
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
          },
        ),
      );
      if (response.data != null) {
        return response.data['latest_invoice']['payment_intent']['client_secret'];
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<void> processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class User {
  final String userName;
  final String email;

  User({required this.userName, required this.email});
}