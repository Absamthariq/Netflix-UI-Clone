import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/home/widgets/customButtonWidget.dart';
import 'package:netflix_clone/presentation/new&hot/widgets/video_widget.dart';

class EveryonesWatch extends StatelessWidget {
  EveryonesWatch({Key? key, required this.index, required this.items})
      : super(key: key);
  HomeController homeController = Get.put(HomeController());
  int index;
  List<DownloadModel> items;

  @override
  Widget build(BuildContext context) {
    final data = items[index];

    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        videowidget(
          index: index,
          items: homeController.released,
        ),
        kHeight5,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * .6,
                    height: 50,
                    child: Text(
                      data.title.toString(),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.orbitron().fontFamily,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const CustomButtonWidget(
                icon: CupertinoIcons.paperplane, title: "Share"),
            kWidth20,
            const CustomButtonWidget(icon: Icons.add, title: "My List"),
            kWidth20,
            const CustomButtonWidget(
                icon: CupertinoIcons.play_fill, title: "Play"),
            kWidth20,
          ],
        ),
        kHeight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            data.overview.toString(),
            maxLines: 5,
            style: GoogleFonts.inter(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
        ),
        kHeight
      ],
    );
  }
}
