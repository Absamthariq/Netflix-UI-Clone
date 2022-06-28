import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/home/widgets/customButtonWidget.dart';
import 'package:netflix_clone/presentation/new&hot/widgets/video_widget.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({Key? key, required this.items, required this.index})
      : super(key: key);
  List<DownloadModel> items;
  int index;

  @override
  Widget build(BuildContext context) {
    final data = items[index];
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: size.height * 0.48,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("JUN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white60)),
              Text(
                "06",
                style: TextStyle(
                    fontFamily: GoogleFonts.anton().fontFamily,
                    fontSize: 27,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.48,
          width: size.width - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.22,
                child: Image.network(baseImage + data.backdropImage.toString(),
                    fit: BoxFit.cover),
              ),
              kHeight5,
              Row(
                children: [
                  kHeight5,
                  Container(
                    width: size.width * .55,
                    child: Text(
                      data.title.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontFamily: GoogleFonts.orbitron().fontFamily,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CustomButtonWidget(
                    icon: Icons.notifications_none_outlined,
                    title: 'Remind Me',
                  ),
                  kWidth20,
                  const CustomButtonWidget(
                      icon: CupertinoIcons.info, title: "Info"),
                  kWidth20
                ],
              ),
              kHeight,
              Text(
                data.releaseDate.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              kHeight5,
              netflixlog(),
              kHeight5,
              kHeight5,
              Text(
                data.overview.toString(),
                maxLines: 5,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container netflixlog() {
    return Container(
      height: 25,
      width: 75,
      color: Color.fromARGB(255, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
            width: 25,
            fit: BoxFit.cover,
          ),
          const Text(
            "FLIM",
            style: TextStyle(letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
