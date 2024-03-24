import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PaymentMethodItem extends StatelessWidget {
  final String image;
  final bool isActive;
  const PaymentMethodItem({Key? key,required this.isActive,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50,color: isActive? const Color(0xFF34A853): Colors.grey),
          borderRadius: BorderRadius.circular(15)
      ),
          shadows: [
            BoxShadow(
              color: isActive? const Color(0xFF34A853):const Color(0xff000080),
              blurRadius: 4,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ]
      ),child: Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: SvgPicture.asset(image,height: 24,fit: BoxFit.scaleDown,),
      ),
    ),
    );
  }
}
