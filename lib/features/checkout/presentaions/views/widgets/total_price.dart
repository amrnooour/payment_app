import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  String title;
  String value;
  TotalPrice({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Styles.style24,),
        Text(value,style: Styles.style24,),
      ],
    );;
  }
}
