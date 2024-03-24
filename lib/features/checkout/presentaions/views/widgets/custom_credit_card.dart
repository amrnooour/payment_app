import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/custom_button_payment.dart';

class CustomCreditCard extends StatefulWidget {
  String cardNumber="" ,expiryDate="",cardHolderName = "",cvvCode = "";
  bool showBackView = false;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  CustomCreditCard({Key? key,required this.formKey,required this.autoValidateMode}) : super(key: key);

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(cardNumber: widget.cardNumber,
            expiryDate: widget.expiryDate,
            cardHolderName: widget.cardHolderName,
            cvvCode: widget.cvvCode,
            showBackView: widget.showBackView,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (value){}),

        CreditCardForm(
            autovalidateMode: widget.autoValidateMode,
            cardNumber: widget.cardNumber,
            expiryDate: widget.expiryDate,
            cardHolderName: widget.cardHolderName,
            cvvCode: widget.cvvCode, onCreditCardModelChange: (creditCardModel){
          widget.expiryDate = creditCardModel.expiryDate;
          widget.cardHolderName = creditCardModel.cardHolderName;
          widget.cvvCode = creditCardModel.cvvCode;
          widget.cardNumber = creditCardModel.cardNumber;
          widget.showBackView = creditCardModel.isCvvFocused;
          setState(() {
          });
            }, formKey: widget.formKey),
      ],
    );
  }
}
