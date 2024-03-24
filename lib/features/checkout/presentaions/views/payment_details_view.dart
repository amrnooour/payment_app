import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
      body: const PaymentDetailsViewBody(),
    );
  }
}
