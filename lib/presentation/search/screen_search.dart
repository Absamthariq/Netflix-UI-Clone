import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/api/search/search.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  final controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  controller.putdata(value.toString());
                },
                backgroundColor: Colors.grey.withOpacity(0.5),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              // Expanded(child: SearchIdle()),
             Obx(
                  ()=>
                   Expanded(child:controller.data.isEmpty?SearchIdle(items: homeController.trending):SearchResultWidget()))
            ],
          ),
        ),
      ),
    );
  }
}
