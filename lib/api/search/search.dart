import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'search.g.dart';


@JsonSerializable()
class SearchModel {
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'release_date')
  String? releasedate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'poster_path')
  String? image;

  SearchModel({
    required this.overview,
    required this.releasedate,
    required this.title,
    required this.image,
  });
  // factory SearchModel.fromJson(Map<String, dynamic> json) =>
  //     _$SearchModelFromJson(json);

  // Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

class SearchService {
  List<SearchModel> modelClassData = [];

  Future<List<SearchModel>> postMethod(query) async {
    var respose = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=1fe4508f3dda5e1b9e2aacbf855a7f70&language=en-US&query=$query&page=1&include_adult=false"));
    if (respose.statusCode == 200) {
      Map body = json.decode(respose.body);

      List allDatas = body['results'];
      modelClassData = allDatas
          .map(
            (e) => SearchModel(
              overview: e['overview'],
              releasedate: e['release_date'],
              title: e['title'],
              image: e['poster_path'],
            ),
          )
          .toList();

      return modelClassData;
    } else {
      return [];
    }
  }
}

class SearchController extends GetxController {
  var Datalist = <SearchModel>[].obs;
  var Loading = true.obs;
  RxList data = [].obs;
  putdata(query) async {
    data.value = await SearchService().postMethod(query);
  }

  @override
  void onInit() {
    putdata('');
    super.onInit();
  }
}