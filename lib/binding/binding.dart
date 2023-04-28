import 'package:get/get.dart';
import 'package:zhongguolaodongfa_app/controller/laodongfa_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(LaoDongFaController());
  }
}
