import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class NoSongs extends StatelessWidget {
  final String text;
  const NoSongs({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.all(20),
    child: Center(
      child: myText(text: text, fontFamily: "Poppins", size: 20, color: white,fontWeight: FontWeight.w700,),
    ));
  }
}
