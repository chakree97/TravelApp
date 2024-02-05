import 'package:get/get_state_manager/get_state_manager.dart';

class BottomNavBarController extends GetxController{
  var current = 0;
  void onChangeCurrentIndex(int page){
    current = page;
    update();
  }
}