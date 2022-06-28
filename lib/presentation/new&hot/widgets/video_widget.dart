import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/core/constands.dart';

class videowidget extends StatelessWidget {
   videowidget({
    Key? key, required this.items,required this.index
  }) : super(key: key);
  List<DownloadModel> items;
  int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
final data = items[index];
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.22,
          child: Image.network(
              baseImage + data.backdropImage.toString(),
              fit: BoxFit.cover),
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black.withOpacity(.3),
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.volumeXmark,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
