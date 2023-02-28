
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../constants/color_constants.dart';
import '../home/controller/home_controller.dart';
final GlobalKey _globalKey = GlobalKey();
 late final Widget? _image;

class PlayerScreen extends StatelessWidget {
  final List<SongModel> data;
  const PlayerScreen({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());


    return Scaffold(
     // resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
            gradient: background
        ),
        child: Padding(
          padding:const EdgeInsets.only(left: 25,right: 25,top: 70),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:const Icon(Icons.close,color: white,size: 30,),
                    ),
                    myText(text: "Now Playing".toUpperCase(), fontFamily: "Poppins",fontWeight: FontWeight.w700, size: 20, color: white),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:const Icon(Icons.menu_sharp,color: white,size: 30,),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Obx(() => Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 250,
                    height: 250,
                    decoration:  BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/musicBack.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:BorderRadius.circular(6)
                    ),
                    alignment: Alignment.bottomLeft,
                    child:Padding(
                        padding:const EdgeInsets.only(top: 15),
                        child:ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: QueryArtworkWidget(
                              id: data[controller.playIndex.value].id,
                              artworkBorder: BorderRadius.circular(15),
                              artworkHeight: 227,
                              artworkWidth: 226,
                              type: ArtworkType.AUDIO,
                              nullArtworkWidget: const SizedBox(
                                  width: 227,
                                  height: 226,
                                  child:  Icon(Icons.music_off,color: white,size: 80,)
                              ),
                            )
                        )
                    )
                )),
                const SizedBox(height: 40),
                Obx(() => myText(text: data[controller.playIndex.value].displayNameWOExt.toString(), fontFamily: "Poppins", size: 16,
                  color: white,fontWeight: FontWeight.w700,textAlign: TextAlign.center,)),
                Obx(() => myText(text: data[controller.playIndex.value].artist.toString(), fontFamily: "Poppins", size: 14,
                  color: white,fontWeight: FontWeight.w500,textAlign: TextAlign.center,),),
                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.favorite,color: blueColor,size: 30,),
                ),
                Obx(() => Slider(
                  min: const Duration(seconds: 0).inSeconds.toDouble(),
                  max: controller.max.value,
                  value: controller.value.value,
                  activeColor: white,
                  thumbColor: blueColor,
                  inactiveColor: white.withOpacity(0.2),
                  onChanged: (newValue)async{
                    controller.changeDurationToSeconds(newValue.toInt());
                    newValue =newValue;
                  },
                )),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myText(text: controller.position.value, fontFamily: "Poppins", size: 15,
                      color: white,fontWeight: FontWeight.w500,),
                    myText(text: controller.duration.value, fontFamily: "Poppins", size: 15,
                      color: white,fontWeight: FontWeight.w500,),
                  ],
                )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon:const Icon(Icons.shuffle,color: white,size: 30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          controller.playSong(data[controller.playIndex.value - 1], controller.playIndex.value - 1);
                        }, icon:const Icon(Icons.skip_previous_rounded,color: white,size: 40,)),
                        Obx(() => GestureDetector(
                          onTap: (){
                            if(controller.isPlaying.value){
                              controller.audioPlayer.pause();
                              controller.isPlaying(false);
                            }
                            else{
                              controller.playSong(data[controller.playIndex.value],controller.playIndex.value);
                            }
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration:const BoxDecoration(
                                color: blueColor,
                                shape: BoxShape.circle
                            ),
                            child:Icon(controller.isPlaying.value? Icons.pause_outlined:Icons.play_arrow_rounded,color: white,size: 50,),
                          ),
                        )),
                        IconButton(onPressed: (){
                          controller.playSong(data[controller.playIndex.value + 1], controller.playIndex.value + 1);
                        }, icon:const Icon(Icons.skip_next_rounded,color: white,size: 40)),
                      ],
                    ),
                    IconButton(onPressed: (){
                      //controller.audioPlayer.setLoopMode(LoopMode.one);
                    }, icon:const Icon(Icons.repeat_one,color: white,size: 30)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
