import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/controller/controller.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/new&hot/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/new&hot/widgets/everyonce_watch.dart';

class ScreenNewAndHot extends StatelessWidget {
   ScreenNewAndHot({Key? key}) : super(key: key);
 HomeController
  homeController= Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "New & Hot",
            style: TextStyle(
                fontFamily: GoogleFonts.anton().fontFamily,
                fontSize: 30,
                ),
          ),
          actions: [
            const Icon(
              Icons.cast,
              color: kwwhiteColor,
            ),
            kWidth,
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.network(
                    'https://www.freepnglogos.com/uploads/netflix-logo-app-png-16.png',fit: BoxFit.cover,),
              ),
            ),
            kWidth
          ],
          bottom: PreferredSize(
            preferredSize: const Size(40.0, 40.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 30,
                width: double.infinity,
                child: TabBar(
                  indicatorWeight: 0,
                  isScrollable: true,
                  unselectedLabelColor: kwwhiteColor,
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                  indicator: BoxDecoration(
                    color: kwwhiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tabs: const [
                    Tab(
                      text: "🍿Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    ),
                    Tab(
                      text: "Top 10",
                    ),
                    
                  ],
                  
                ),
                
              ),
              
            ),
          ),
        ),
        body: TabBarView(
          children: [
            tabBarCommingSoon,
            tabBarEveryone(),
            tabBarEveryone(),
          ],
        ),
      ),
    );
  }

  Widget get tabBarCommingSoon {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => ComingSoon(index: index, items: homeController.commingsoon,));
  }

  Widget tabBarEveryone() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => EveryonesWatch(index: index, items: homeController.released));
  }
}
