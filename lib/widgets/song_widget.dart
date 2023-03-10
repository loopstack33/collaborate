import 'package:collaborate/constants/color_constants.dart';
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongWidget extends StatelessWidget {
  final String text;
  final int id;
  final ArtworkType type;
  const SongWidget({Key? key,required this.text,required this.id,required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        QueryArtworkWidget(id: id,
            type: type,
            artworkHeight: 100,
            artworkWidth: 100,
            nullArtworkWidget: Container(
                width: 100,
                height: 100,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyText
                ),
                child:const Icon(
                  Icons.music_off,
                  color: white,
                  size: 35,
                ))
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 150,
          child: myText(text: text, fontFamily: "Poppins", size:14, color: white,fontWeight: FontWeight.w500,textAlign: TextAlign.center,)
        )
      ],
    );
  }
}
