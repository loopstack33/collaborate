import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class ButtonWidget extends StatelessWidget {
  final IconData image;
  final bool isPop;
  const ButtonWidget({Key? key,required this.image,required this.isPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:isPop? 45: 50,
      height:isPop? 45: 50,
      decoration: BoxDecoration(
        color: white.withOpacity(0.2),
        borderRadius:isPop? null:BorderRadius.circular(17),
        shape: isPop? BoxShape.circle:BoxShape.rectangle
      ),
      child: Padding(
        padding:const EdgeInsets.all(1),
        child: Icon(image,color: white,),
      )
    );
  }
}
