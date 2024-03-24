import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomButtonPayment extends StatelessWidget {
  String text;
  final bool isLoading;
  void Function()? onTap;
  CustomButtonPayment({Key? key,required this.text,this.onTap,this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color:  const Color(0xFF34A853),
        ),
        child: Center(child: isLoading ? const Center(child: CircularProgressIndicator()) :Text(text,style: Styles.style22,),),
      ),
    );
  }
}
