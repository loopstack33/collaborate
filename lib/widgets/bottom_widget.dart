import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class BottomWidget extends StatelessWidget {
  final String text;
  final String subText;
  final String image;
  final VoidCallback onTap;
  const BottomWidget({Key? key,required this.onTap,required this.text,required this.image,required this.subText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding:const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:BorderRadius.circular(6)
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myText(text: text, fontFamily: "Poppins", size: 15, color: white,fontWeight: FontWeight.w700,),
                    myText(text: subText, fontFamily: "Poppins", size: 13, color: white,fontWeight: FontWeight.w500,)
                  ],
                ),
              ],
            ),
            const Icon(Icons.play_arrow,color: white,size: 30,)
          ],
        ));
  }
}
