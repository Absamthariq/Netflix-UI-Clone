import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constands.dart';

class NumberCard extends StatelessWidget {
   NumberCard({Key? key, required this.index,required this.items}) : super(key: key);
  final int index;
    List<DownloadModel> items;


  @override
  Widget build(BuildContext context) {
    final data = items[index];
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 250,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                       baseImage + data.image.toString()),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 3,
          bottom: -20,
          child: BorderedText(
            strokeColor: kwwhiteColor,
            strokeWidth: 8.0,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 130,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
