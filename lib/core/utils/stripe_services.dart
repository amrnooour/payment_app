
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/checkout/data/models/PaymentIntentModel.dart';
import 'package:payment_app/features/checkout/data/models/init_payment_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';

import '../../features/checkout/data/models/EpheremalKeyModel.dart';

class StripeServices{
  final ApiService apiService =ApiService();
  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async{
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentInputModel.toJson(), url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
  Future intiPaymentSheet({required InitiPaymentSheetInputModel initiPaymentSheetInputModel}) async{
   await Stripe.instance.initPaymentSheet(
       paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
      merchantDisplayName: "Amr",
         customerEphemeralKeySecret: initiPaymentSheetInputModel.emphemeralKey,
         customerId: initiPaymentSheetInputModel.customerId,
    ));
  }
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var emphemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    var initiPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        emphemeralKey: emphemeralKeyModel.secret!);
    await intiPaymentSheet(initiPaymentSheetInputModel: initiPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EpheremalKeyModel> createEphemeralKey({required String customerId}) async{
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: {
          "customer" : customerId,
        }, url: "https://api.stripe.com/v1/ephemeral_keys",
        headers: {
            "Authorization" : "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version" : "2023-10-16",
        },);
    var ephemeralKeyModel = EpheremalKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}