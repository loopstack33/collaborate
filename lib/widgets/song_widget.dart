import 'package:collaborate/constants/color_constants.dart';
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SongWidget extends StatelessWidget {
  final String text;
  final String image;
  const SongWidget({Key? key,required this.text,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  image),
              fit: BoxFit.cover,
            ),
            borderRadius:BorderRadius.circular(15)
          ),
        ),
        const SizedBox(height: 5),
        myText(text: text, fontFamily: "Poppins", size: 18, color: white,fontWeight: FontWeight.w600,)
      ],
    );
  }
}
