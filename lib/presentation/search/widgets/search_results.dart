import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/api/search/search.dart';
import 'package:netflix_clone/core/constands.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pWHf4khOloNVfCxscsXFj3jj6gP.jpg';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({Key? key}) : super(key: key);
  final controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: Obx(() {
            return GridView.count(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1 / 1.4,
              children:List.generate(controller.data.length, (index) {
                final datas = controller.data[index];
                final image = baseImage + datas.image.toString();
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Image border
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(10), // Image radius
                    child: datas.image == null
                        ? const Center(
                            child: Text('No image found'),
                          )
                        : Image.network(image, fit: BoxFit.cover),
                  ),
                );
              },
              ),
            );
          }),
        )
      ],
    );
  }
}

class MainCardSearch extends StatelessWidget {
  const MainCardSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(imageurl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
