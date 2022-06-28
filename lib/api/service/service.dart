import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:netflix_clone/api/model/comming.dart';

List urls = [
  "https://api.themoviedb.org/3/trending/movie/week?api_key=02d258b8f9ef9e3dbfc706604142fe59",
  "https://api.themoviedb.org/3/movie/now_playing?api_key=02d258b8f9ef9e3dbfc706604142fe59&language=en-US&page=1",
  "https://api.themoviedb.org/3/tv/on_the_air?api_key=02d258b8f9ef9e3dbfc706604142fe59&language=en-US&page=1",
  "https://api.themoviedb.org/3/tv/top_rated?api_key=02d258b8f9ef9e3dbfc706604142fe59&language=en-US&page=1",
  "https://api.themoviedb.org/3/movie/upcoming?api_key=1fe4508f3dda5e1b9e2aacbf855a7f70&language=en-US&page=1",
];

class DownloadService extends GetxController {
  Future<List<DownloadModel>?> getMethod(String urls) async {
    var respose = await http.get(Uri.parse(urls));
    if (respose.statusCode == 200) {
      Map<String, dynamic> body = await json.decode(respose.body);

      List allData = body['results'];

      List<DownloadModel> modelClassData = allData
          .map(
            (e) => DownloadModel(
              overview: e['overview'],
              releaseDate: e['release_date'],
              title: e['title'],
              image: e['poster_path'],
              backdropImage: e['backdrop_path']
            
            ),
          )
          .toList();

      return modelClassData;
    } else {
      return null;
    }
  }
}
