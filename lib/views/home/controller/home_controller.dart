import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController{
final audioQuery = OnAudioQuery();
final audioPlayer = AudioPlayer();

var playIndex = 0.obs;
var max = 0.0.obs;
var value = 0.0.obs;
var isPlaying = false.obs;
var permissionGranted = false.obs;

var duration = ''.obs;
var position = ''.obs;

@override
  void onInit() {
    super.onInit();
    checkPermission();
  }

checkPermission() async{
  var permission = await Permission.storage.request();
  if(permission.isGranted){
    permissionGranted(true);
   log("PERMISSION GRANTED");
  }
  else{
    checkPermission();
  }
}

setIndex(index){
  playIndex.value =index;
  updatePosition();
}

playSong(SongModel data, index){
  playIndex.value =index;
  try{
   if(audioPlayer.playing){
     audioPlayer.stop();
     isPlaying(false);
   }
   else{
     audioPlayer.setAudioSource(
         AudioSource.uri(Uri.parse(data.uri!),
           tag: MediaItem(
             id: data.id.toString(),
             album: data.album.toString(),
             title: data.displayNameWOExt.toString(),
             artUri: Uri.parse("https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
           ),)
     );
     audioPlayer.play();
     isPlaying(true);
     updatePosition();
   }
  }
 on Exception catch (e){
    log(e.toString());
  }
}


updatePosition(){
  audioPlayer.durationStream.listen((d) {
    {
      duration.value = d.toString().split(".")[0];
      max.value=d!.inSeconds.toDouble();
    }});

  audioPlayer.positionStream.listen((p) {
    {
      position.value = p.toString().split(".")[0];
      value.value=p.inSeconds.toDouble();
    }});
}

changeDurationToSeconds(seconds){
  var duration = Duration(seconds: seconds);
  audioPlayer.seek(duration);
}

}