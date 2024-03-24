import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/presentaions/manger/payment_cubit.dart';
import 'package:payment_app/features/checkout/presentaions/manger/payment_states.dart';
import 'package:payment_app/features/checkout/presentaions/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/custom_button_payment.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16,),
          const PaymentMethodsListView(),
          const SizedBox(height: 32,),
          BlocConsumer<PaymentCubit,PaymentStates>(
              listener: (context, state) {
                if(state is SuccessPaymentState){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ThankYouView(),));
                }
                if(state is FailurePaymentState){
                  Navigator.of(context).pop();
                  SnackBar snackBar =SnackBar(content: Text(state.errorMessage));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                return CustomButtonPayment(
                  onTap: (){
                    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: "100", currency: "USD",
                    customerId: "cus_PnR446uivfrVVh");
                    BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
                  },
                    isLoading: state is LoadingPaymentState ? true :false,
                    text: "Continue");
              },)
        ],
      ),
    );
  }
}
