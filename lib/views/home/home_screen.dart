import 'package:collaborate/constants/color_constants.dart';
import 'package:collaborate/widgets/button_widget.dart';
import 'package:collaborate/widgets/search_widget.dart';
import 'package:collaborate/widgets/song_widget.dart';
import 'package:collaborate/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
          gradient: background
        ),
        child:SafeArea(
          child: Padding(
            padding:const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     myText(text: "Welcome Back", fontFamily: "Poppins", size: 16, color: white,fontWeight: FontWeight.w500,),
                     myText(text: "Manan", fontFamily: "Poppins", size: 25, color: white,fontWeight: FontWeight.w700,)
                   ],
                 ),
                const ButtonWidget(image: Icons.headset_outlined)
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
                        myText(text: "Hi There", fontFamily: "Poppins", size: 20, color: white,fontWeight: FontWeight.w700,),
                        myText(text: "RECENTLY PLAYED", fontFamily: "Poppins", size: 15, color: white,fontWeight: FontWeight.w600,)
                      ],
                    ),
                    myText(text: "See more", fontFamily: "Poppins", size: 15, color: greyText,fontWeight: FontWeight.w600,),

                  ],
                ),
                const SizedBox(height: 30),
                Expanded(child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return const Padding(padding: EdgeInsets.only(right: 20),child: SongWidget(text: "Pasoori",
                        image: 'assets/images/image.png'));
                  },itemCount: 5,
                  shrinkWrap: true,))
              ],
            ),
          )
        )
      ),
    );
  }
}
