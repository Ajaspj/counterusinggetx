import 'package:counterusinggetx/api/apiservice.dart';
import 'package:counterusinggetx/model/cartmodel.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  var list = <Carts>[].obs;

  Future<void> fetchdata() async {
    Apiservice apiService = Apiservice();
    var fetchedList = await apiService.fetchData();

    if (fetchedList != null) {
      list.value = fetchedList;
      update();
    }
  }
}
