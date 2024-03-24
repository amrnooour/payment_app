import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  final String title;
  final String value;
  const PaymentItemInfo({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Styles.style18,textAlign: TextAlign.center,),
        Text(value,style: Styles.styleBold18,textAlign: TextAlign.center),


      ],
    );
  }
}
