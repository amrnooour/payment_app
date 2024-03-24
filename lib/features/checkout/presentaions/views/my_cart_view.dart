import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
