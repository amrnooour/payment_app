import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        width: 305,
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 22),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.masterCard),
            const SizedBox(width: 23,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text("Credit Card",style: TextStyle(color: Colors.black,
                     fontSize: 18,fontFamily: "Inter",fontWeight: FontWeight.w400,height: 0)),
                 Text("MasterCard**78",style: TextStyle(color: Colors.black.withOpacity(0.699999),
                     fontSize: 16,fontFamily: "Inter",fontWeight: FontWeight.w400,height: 0)),
               ],
             )
          ],
        ),
      ),
    );
  }
}
