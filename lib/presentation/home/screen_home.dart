import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/home/widgets/customButtonWidget.dart';
import 'package:netflix_clone/presentation/home/widgets/numberTitleCard.dart';

import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  HomeController
  homeController= Get.put(HomeController());

  final String imageurl =
      'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
    
      body:
      ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 550,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imageurl),
                                    fit: BoxFit.fill),),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const CustomButtonWidget(
                                    icon: Icons.add,
                                    title: 'My List',
                                  ),
                                  playMethod(),
                                  const CustomButtonWidget(
                                    icon: Icons.info,
                                    title: 'info',
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      kHeight,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children:  [
                            MainTitleCard(
                              title: 'Released In Past Year', items: homeController.released,
                            ),
                            kHeight,
                            MainTitleCard(title: 'Trending Now',items: homeController.trending),
                            kHeight,
                            NumberTitleCard(items: homeController.topair, ),
                            kHeight,
                            MainTitleCard(title: 'Tense Dramas',items: homeController.commingsoon),
                            kHeight,
                            MainTitleCard(title: 'South Indian Cinema',items: homeController.released),
                          ],
                        ),
                      ),
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(microseconds: 2000),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .11,
                          color: Colors.black.withOpacity(.5),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://www.edigitalagency.com.au/wp-content/uploads/Netflix-N-Symbol-logo-red-transparent-RGB-png.png",fit: BoxFit.fill,
                                      width: 40,
                                      height: 60,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 28,
                                      height: 30,
                                      child:
                                          Image.network('https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',fit: BoxFit.fill),
                                    ),
                                  ],
                                ),
                              ),
                              kHeight,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "Tv Shows",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text("Movies",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const Text("Categories",
                                      style:  TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            );
          }),
    );
  }

  TextButton playMethod() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kwwhiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'play',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
