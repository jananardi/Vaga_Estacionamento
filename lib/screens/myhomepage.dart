import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_estacionamento_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ListEstacionamentoController.listEstacionamento;

  @override
  void initState() {
    super.initState();
    controller.listEstacionamentoAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {return const Center(child: CircularProgressIndicator(),);}
        if (controller.listEstacionamentoObs.isEmpty) {return const Center(child: Text('Nenhuma vaga encontrada.'),);}
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.listEstacionamentoObs.length,
          itemBuilder: (BuildContext context, int index) {
            final vaga = controller.listEstacionamentoObs[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.directions_car,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  'Vaga: ${vaga.parkingSpotNumber}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Veículo: ${vaga.modelCar} - ${vaga.colorCar} (${vaga.licensePlateCar})'),
                    Text('Responsável: ${vaga.responsibleName} (Ap: ${vaga.apartment} - Bl: ${vaga.block})'),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                },
              ),
            );
          },
        );
      }),
    );
  }
}