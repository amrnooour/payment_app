import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onPressed: (){
        Navigator.pop(context);
      }),
      body: Transform.translate(
          offset: const Offset(0,-16),
          child: const ThankYouViewBody()),
    );
  }
}
