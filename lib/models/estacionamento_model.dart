class EstacionamentoModel {
  final String id;
  final String parkingSpotNumber;
  final String licensePlateCar;
  final String brandCar;
  final String modelCar;
  final String colorCar;
  final String responsibleName;
  final String apartment;
  final String block;

  EstacionamentoModel(
      this.id,
      this.parkingSpotNumber,
      this.licensePlateCar,
      this.brandCar,
      this.modelCar,
      this.colorCar,
      this.responsibleName,
      this.apartment,
      this.block
      );

  EstacionamentoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        parkingSpotNumber = json['parkingSpotNumber'],
        licensePlateCar = json['licensePlateCar'],
        brandCar = json['brandCar'],
        modelCar = json['modelCar'],
        colorCar = json['colorCar'],
        responsibleName = json['responsibleName'],
        apartment = json['apartment'],
        block = json['block'];
}
