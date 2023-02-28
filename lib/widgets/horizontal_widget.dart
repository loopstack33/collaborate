import 'package:collaborate/widgets/button_widget.dart';
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../constants/color_constants.dart';
import '../views/home/controller/home_controller.dart';

class HorizontalPlay extends StatelessWidget {
  final String text;
  final String subText;
  final int id;
  final ArtworkType type;
  final VoidCallback onTap;
  final int index;
  const HorizontalPlay({Key? key,required this.index,required this.text,required this.id,required this.subText,required this.type,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            QueryArtworkWidget(id: id,
              type: type,
              nullArtworkWidget:const SizedBox(
                width: 50,
                height: 50,
                child:  Icon(
                  Icons.music_note,
                  color: white,
                  size: 32,
                ))
              ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: myText(text: text, fontFamily: "Poppins", size: 14, color: white,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child:  myText(text: subText, fontFamily: "Poppins", size: 12, color: white,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis)
                ),

              ],
            ),
          ],
        ),
        Obx(() {
          if(controller.playIndex.value==index && controller.isPlaying.value){
          return GestureDetector(
              onTap: onTap,
              child: const ButtonWidget(image:Icons.stop_rounded,isPop: true,)
          );
          }
          else{
           return GestureDetector(
               onTap: onTap,
               child: const ButtonWidget(image:Icons.play_arrow_rounded,isPop: true,)
           );
          }
        })
      ],
    );
  }
}
