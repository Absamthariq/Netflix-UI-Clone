import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
   NumberTitleCard({
    Key? key,required this.items, 
  }) : super(key: key);
      List<DownloadModel> items;
      
      HomeController
  homeController= Get.put(HomeController());

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows In India Today'),
        const SizedBox(height: 5),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(index: index, items: homeController.topair,),
            ),
          ),
        )
      ],
    );
  }
}