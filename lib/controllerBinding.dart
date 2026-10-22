import 'package:get/get.dart';

import 'controllers/list_estacionamento_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListEstacionamentoController>( () => ListEstacionamentoController());
  }
}