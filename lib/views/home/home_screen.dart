import 'dart:developer';

import 'package:collaborate/constants/color_constants.dart';
import 'package:collaborate/views/home/controller/home_controller.dart';
import 'package:collaborate/views/player/player_screen.dart';
import 'package:collaborate/widgets/bottom_widget.dart';
import 'package:collaborate/widgets/button_widget.dart';
import 'package:collaborate/widgets/fav_widget.dart';
import 'package:collaborate/widgets/horizontal_widget.dart';
import 'package:collaborate/widgets/no_songs.dart';
import 'package:collaborate/widgets/search_widget.dart';
import 'package:collaborate/widgets/song_widget.dart';
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../utils/transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());


    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
          gradient: background
        ),
        child: Obx((){
          if(controller.permissionGranted.value){
            return  Column(children: [
              Expanded(
                  flex: 11,
                  child: Padding(
                      padding:const EdgeInsets.only(left: 25,right: 25,top: 25),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(text: "Welcome Back", fontFamily: "Poppins", size: 14, color: white,fontWeight: FontWeight.w500,),
                                    myText(text: "Manan", fontFamily: "Poppins", size: 22, color: white,fontWeight: FontWeight.w700,)
                                  ],
                                ),
                                const ButtonWidget(image: Icons.playlist_play_sharp,isPop: false,)
                              ],
                            ),
                            const SizedBox(height: 20),
                            const SearchWidget(),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(text: "Hi There", fontFamily: "Poppins", size: 14, color: white,fontWeight: FontWeight.w700,),
                                    myText(text: "RECENTLY PLAYED", fontFamily: "Poppins", size: 12, color: white,fontWeight: FontWeight.w600,)
                                  ],
                                ),
                                myText(text: "See more", fontFamily: "Poppins", size: 12, color: greyText,fontWeight: FontWeight.w600,),

                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                                height: 190,
                                child:FutureBuilder<List<AlbumModel>>(
                                    future: controller.audioQuery.queryAlbums(
                                        ignoreCase: true,
                                        orderType: OrderType.DESC_OR_GREATER,
                                        sortType: null,
                                        uriType: UriType.EXTERNAL
                                    ),
                                    builder:(context,snapshot){
                                      if(snapshot.data==null){
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: blueColor,
                                          ),
                                        );
                                      }
                                      else if(snapshot.data!.isEmpty){
                                        return const NoSongs(text: "No Recently Found",);
                                      }
                                      else{
                                        return ListView.builder(
                                          physics: const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context,index){
                                            return  Padding(padding:const EdgeInsets.only(right: 10),
                                                child: SongWidget(text: snapshot.data![index].album.toString(),
                                                    id: snapshot.data![index].id,type: ArtworkType.ALBUM));
                                          },itemCount: snapshot.data!.length,
                                          shrinkWrap: true,);
                                      }
                                    })),
                            myText(text: "Favorites", fontFamily: "Poppins", size: 14, color: white,fontWeight: FontWeight.w700,),
                            const SizedBox(height: 20),
                            SizedBox(
                                height: 170,
                                child: FutureBuilder<List<ArtistModel>>(
                                    future: controller.audioQuery.queryArtists(
                                        ignoreCase: true,
                                        orderType: OrderType.DESC_OR_GREATER,
                                        sortType: null,
                                        uriType: UriType.EXTERNAL
                                    ),
                                    builder:(context,snapshot){
                                      if(snapshot.data==null){
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: blueColor,
                                          ),
                                        );
                                      }
                                      else if(snapshot.data!.isEmpty){
                                        return const NoSongs(text: "No Artists Found",);
                                      }
                                      else{
                                        return ListView.builder(
                                          physics: const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context,index){
                                            return FavWidget(text: snapshot.data![index].artist.toString(),id: snapshot.data![index].id,type: ArtworkType.ARTIST);
                                          },itemCount: snapshot.data!.length,
                                          shrinkWrap: true,);
                                      }
                                    })
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myText(text: "MOST POPULAR", fontFamily: "Poppins", size: 14, color: white,fontWeight: FontWeight.w700,),
                                myText(text: "See more", fontFamily: "Poppins", size: 12, color: greyText,fontWeight: FontWeight.w600,),
                              ],
                            ),
                            FutureBuilder<List<SongModel>>(
                                future: controller.audioQuery.querySongs(
                                    ignoreCase: true,
                                    orderType: OrderType.ASC_OR_SMALLER,
                                    sortType: null,
                                    uriType: UriType.EXTERNAL
                                ),
                                builder:(context,snapshot){
                                  if(snapshot.data==null){
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: blueColor,
                                      ),
                                    );
                                  }
                                  else if(snapshot.data!.isEmpty){
                                    return const NoSongs(text: "No Songs Found",);
                                  }
                                  else{
                                    return ListView.builder(
                                      padding:const EdgeInsets.only(top: 15),
                                      physics:const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                            onTap: (){
                                              controller.playSong(snapshot.data![index],index);
                                              Navigator.of(context).push(createRoute(PlayerScreen(
                                                data: snapshot.data!,
                                              )));
                                            },
                                            child: Padding(padding:const EdgeInsets.only(bottom: 20),
                                                child: HorizontalPlay(index: index,text: snapshot.data![index].displayNameWOExt.toString(),
                                                  id: snapshot.data![index].id,type: ArtworkType.AUDIO,subText:snapshot.data![index].artist.toString(),
                                                  onTap: (){
                                                    controller.playSong(snapshot.data![index],index);
                                                  },))
                                        );
                                      },itemCount: snapshot.data!.length,
                                      shrinkWrap: true,);
                                  }
                                }),
                          ],
                        ),
                      )
                  )),
              // controller.isPlaying.value?
              // Expanded(child:Align(
              //     alignment: Alignment.bottomCenter,
              //     child: GestureDetector(
              //       onTap: (){
              //         // Navigator.of(context).push(createRoute(PlayerScreen(
              //         //   data: snapshot.data!,
              //         // )));
              //       },
              //       child: Container(
              //         width: MediaQuery.of(context).size.width,
              //         height: 100,
              //         decoration: BoxDecoration(
              //             color: white.withOpacity(0.2)
              //         ),
              //         child:BottomWidget(text: "", image: "assets/images/image.png", subText: "-Aditya A",
              //           onTap: (){
              //
              //           },),
              //       ),
              //     )
              //
              // ))
              // :const SizedBox()
            ]);
          }
          else {
            return const Center(child: CircularProgressIndicator(color: blueColor));
          }
        })
      ),
    );
  }
}
