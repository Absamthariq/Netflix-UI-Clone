import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constands.dart';

class AppBarWidget extends StatelessWidget {
   AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: const TextStyle(fontSize: 30,),),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 25,
        ),
        kWidth,
        SizedBox(
                                      width: 30,
                                      height: 30,
                                      child:
                                          Image.network('https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',fit: BoxFit.fill,),
                                    ),
        kWidth,
      ],
    );
  }
}
