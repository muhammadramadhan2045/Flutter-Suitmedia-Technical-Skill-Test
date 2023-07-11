import 'package:get/get.dart';

class SelectedUserController extends GetxController {
  RxString selectedUserName = ''.obs;

  void setSelectedUserName(String name) {
    selectedUserName.value = name;
  }
}
