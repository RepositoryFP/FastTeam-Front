import 'package:fastteam_app/presentation/list_division_screen/controller/list_division_controller.dart';


import 'package:get/get.dart';

class ListDivisionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListDivisionController());
  }
}
