import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString name = "John Doe".obs;
  RxString email = "john.doe@example.com".obs;

  void updateName(String newName) {
    name.value = newName;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  String get currentName => name.value;
  String get currentEmail => email.value;
}
