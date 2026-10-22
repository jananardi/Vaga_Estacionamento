import 'package:estacionamento/models/estacionamento_model.dart';
import 'package:get/get.dart';
import '../services/estacionamento_service.dart';

class ListEstacionamentoController extends GetxController {
  EstacionamentoService estacionamentoService = EstacionamentoService();

  var isLoading = false.obs;
  var listEstacionamentoObs = <EstacionamentoModel>[].obs;

  static ListEstacionamentoController get listEstacionamento => Get.find();

  Future<dynamic> listEstacionamentoAsync() async {
    try {
      isLoading.value = true;
      var list = await estacionamentoService.fetchListEstacionamentoModel();
      listEstacionamentoObs.value = list.listEstacionamentoModel;
    } catch (e) {
      print('Error ao carregar a lista: $e');
    } finally {
      isLoading.value = false;
    }

    return listEstacionamentoObs;
  }
}