class FuelTypes {
  final String fuelType;
  final String imageUrl;
  final String imageUrlWhite;
FuelTypes(this.fuelType,this.imageUrl,this.imageUrlWhite);
}

final List fuelTypes = [
  FuelTypes('Petrol','assets/images/fuel.png','assets/images/fuel white.png'),
  FuelTypes('Diesel','assets/images/fuel.png','assets/images/fuel white.png'),
  FuelTypes('Hybrid','assets/images/fuel.png','assets/images/fuel white.png'),
  FuelTypes('Electric','assets/images/fuel.png','assets/images/fuel white.png'),
];

class TransmissionTypes {
  final String transmissionType;
  final String imageUrl;
  final String imageUrlWhite;
  TransmissionTypes(this.transmissionType,this.imageUrl,this.imageUrlWhite);
}

final List transmissionTypes = [
  TransmissionTypes('Manual','assets/images/manual black.png','assets/images/manual white.png'),
  TransmissionTypes('Automatic','assets/images/auto black.png','assets/images/auto white.png')
];

