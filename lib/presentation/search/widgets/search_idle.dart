import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/uhYpkLSnlOXTQDmNnu1X4MHMt1S.jpg';

class SearchIdle extends StatelessWidget {
  List<DownloadModel> items;

  SearchIdle({Key? key, required this.items}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: 'Top Search',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearchItem(
                    index: index,
                    items: controller.released,
                  ),
              separatorBuilder: (context, index) => kHeight,
              itemCount: items.length),
        )
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  TopSearchItem({Key? key, required this.items, required this.index})
      : super(key: key);
  List<DownloadModel> items;
  int index;

  @override
  Widget build(BuildContext context) {
    final data = items[index];
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "http://image.tmdb.org/t/p/w500" + data.image.toString(),
              ),
            ),
          ),
        ),
         Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              data.title.toString(),
              style: TextStyle(
                  color: kwwhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
        Icon(
          CupertinoIcons.play_circle_fill,
          size: 40,
          color: Colors.white,
        ),
      ],
    );
  }
}
