import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({final String? title,void Function()? onPressed}){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title:  Text(title??"",style: Styles.style25,),
    centerTitle: true,
    leading:  IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back,color: Colors.black,),),
  );
}