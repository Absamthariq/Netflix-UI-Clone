import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/downloads/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List imagepath = [
    "9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
    "7COPO5B9AOKIB4sEkvNu0wfve3c.jpg",
    "5TdKvZimLSJHPQW8t3ctlsusnmH.jpg"
  ];

  String imageBasecUrl = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(
            title: 'Downloads',
          ),
          preferredSize: Size.fromHeight(50),
        ),
        body: ListView(
          children: [
            _SmartDownloads(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Introducing Downloads for You',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kwwhiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            kHeight,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'We will download a persinakisded selection of movies and shows for you, so thers always something to watch on your device. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: size.width * 0.41,
                  ),
                  DownloadsImageWidgets(
                    size: Size(size.width * 0.40, size.width * 0.60),
                    imagepath: imageBasecUrl + imagepath[0],
                    margin: EdgeInsets.only(left: 150, bottom: 22),
                    angle: 15,
                  ),
                  DownloadsImageWidgets(
                    size: Size(size.width * 0.40, size.width * 0.60),
                    imagepath: imageBasecUrl + imagepath[1],
                    margin: EdgeInsets.only(right: 150, bottom: 22),
                    angle: -15,
                  ),
                  DownloadsImageWidgets(
                    size: Size(size.width * 0.44, size.width * 0.70),
                    imagepath: imageBasecUrl + imagepath[2],
                    margin: EdgeInsets.only(left: 0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.blue,
                child: const Text(
                  'Set up',
                  style: TextStyle(
                    color: kwwhiteColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                child: const Text(
                  'See What Can You Download',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kwwhiteColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    required this.imagepath,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imagepath;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imagepath),
          ),
        ),
      ),
    );
  }
}
