import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/custom_check_icon.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/custom_dashed_line.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =  MediaQuery.of(context).size.height;


    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: height*.2+20,
            child: const CustomDashedLine()
          ),
          Positioned(
            bottom:height*.2,
              left: -20,
              child: const CircleAvatar(
            backgroundColor: Colors.white,
          )),
          Positioned(
              bottom:height*.2,
              right: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const CustomCheckIcon(),

        ],
      ),
    );
  }
}
