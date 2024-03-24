import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  String title;
  String value;
  OrderInfoItem({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Styles.style18,),
        Text(value,style: Styles.style18,),
      ],
    );
  }
}
