import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentaions/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/custom_credit_card.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/payment_methods_list_view.dart';

import 'custom_button_payment.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey =GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:  [
        const SliverToBoxAdapter(child: PaymentMethodsListView(),),
        SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey,autoValidateMode: autoValidateMode,),),
        SliverFillRemaining(
          hasScrollBody: false,
          child:Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12,left: 16,right: 16),
                child: CustomButtonPayment(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ThankYouView(),));
                      }else{
                        autoValidateMode =AutovalidateMode.always;
                        setState(() {
                        });
                      }
                    },
                    text: "pay"),
              )),),
      ],
    );
  }
}
