import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:payment_app/features/checkout/presentaions/manger/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit(this.checkoutRepo) : super(InitialPaymentState());
  final CheckoutRepo checkoutRepo;

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
      emit(LoadingPaymentState());
      var data = await checkoutRepo.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      data.fold((failure) => {
        emit(FailurePaymentState(errorMessage: failure.errorMessage)),
      }, (success) => {
      emit(SuccessPaymentState()),
      });
    }
}