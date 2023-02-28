import 'package:collaborate/constants/color_constants.dart';
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavWidget extends StatelessWidget {
  final String text;
  final int id;
  final ArtworkType type;
  const FavWidget({Key? key,required this.text,required this.id,required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        QueryArtworkWidget(id: id,
            type: type,
            artworkHeight: 80,
            artworkWidth: 80,
            nullArtworkWidget: Container(
                width: 80,
                height: 80,
                decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: greyText
                ),
                child:const Icon(
                  Icons.image_not_supported_outlined,
                  color: white,
                  size: 35,
                ))
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 140,
          child: myText(text: text, fontFamily: "Poppins", size:12, color: white,fontWeight: FontWeight.w500,textAlign: TextAlign.center,)
        )
      ],
    );
  }
}
