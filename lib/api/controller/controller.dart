import 'package:get/get.dart';
import 'package:netflix_clone/api/service/service.dart';

import '../model/comming.dart';

class HomeController extends GetxController {
  List<DownloadModel> released = [];
  List<DownloadModel> trending = [];
  List<DownloadModel> topair = [];
  List<DownloadModel> commingsoon = [];
  List<DownloadModel> fastandlaf = [];

  var Loading = true.obs;

  Future<List<DownloadModel>> getData(String url) async {
    Loading.value = true;
    try {
      var data = await DownloadService().getMethod(url);

      Loading.value = false;
      return data!;
    } catch (e) {
      Get.snackbar('oops', ' $e');

      Loading.value = false;
      return [];
    }
  }

  @override
  void onInit() {
    getData(urls[0]).then((value) {
      released = value;
    });
    getData(urls[1]).then((value) {
      trending = value;
    });
    getData(urls[2]).then((value) {
      topair = value;
    });
    getData(urls[3]).then((value) {
      commingsoon = value;
    });
    getData(urls[4]).then((value) {
      commingsoon = value;
    });

    // TODO: implement onInit
    super.onInit();
  }
}
