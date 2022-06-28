import 'package:flutter/material.dart';
import 'package:netflix_clone/api/model/comming.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  List<DownloadModel> items;
  MainTitleCard({Key? key, required this.title, required this.items})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(items.length, (index) {
              final data = items[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: kRadius10,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(baseImage + data.image.toString()),
                    ),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
