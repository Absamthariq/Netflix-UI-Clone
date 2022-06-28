
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constands.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,required this.icon,required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Icon(
          icon,
          color: kwwhiteColor,
          size: 26,
        ),
        kHeight,
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w500)
          ,
        )
      ],
    );
  }
}
