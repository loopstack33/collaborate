import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class ButtonWidget extends StatelessWidget {
  final IconData image;
  const ButtonWidget({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(17),

      ),
      child: Padding(
        padding:const EdgeInsets.all(12),
        child: Icon(image,color: white,),
      )
    );
  }
}
