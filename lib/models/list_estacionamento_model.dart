import 'estacionamento_model.dart';

class ListEstacionamentoModel {
  final List<EstacionamentoModel> listEstacionamentoModel;

  ListEstacionamentoModel(this.listEstacionamentoModel);

  ListEstacionamentoModel.fromJson(Map<String, dynamic> json)
      : listEstacionamentoModel = (json['listEstacionamento'] as List? ?? [])
      .map((item) => EstacionamentoModel.fromJson(item as Map<String, dynamic>))
      .toList();
}