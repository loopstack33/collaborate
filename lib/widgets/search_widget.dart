
import 'package:collaborate/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(50)
      ),
      child: TextFormField(
        decoration:const InputDecoration(
          border: InputBorder.none,
          hintText: "Search song",
          hintStyle: TextStyle(color: white,fontSize: 14,fontFamily: "Poppins",fontWeight: FontWeight.w300),
          suffixIcon: Icon(Icons.mic_rounded,color: white,size: 20,),
          prefixIcon: Icon(Icons.search_rounded,color: white,size: 20,),
        ),
      ),
    );
  }
}

