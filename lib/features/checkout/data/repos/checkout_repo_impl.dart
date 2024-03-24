import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failures.dart';
import 'package:payment_app/core/utils/stripe_services.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'checkout_repo.dart';


class CheckoutRepoImpl extends CheckoutRepo{
  final StripeServices stripeServices =StripeServices();
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    try{
      await stripeServices.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    }catch(e){
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

}