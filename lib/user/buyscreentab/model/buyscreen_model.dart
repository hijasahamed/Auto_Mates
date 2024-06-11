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


final List seatCapacity = [
  '5',
  '6',
  '7',
  '8',
  '8+',
]; 


class Budget {
  final String ratio;
  final String budget;
Budget(this.ratio,this.budget,);
}

final List budgetsForFilter = [
  Budget('Under', '1'),
  Budget('Under', '2'),
  Budget('Under', '3'),
  Budget('Under', '4'),
  Budget('Under', '5'),
  Budget('Under', '6'),
  Budget('Under', '7'),
  Budget('Under', '8'),
  Budget('Under', '9'),
  Budget('Under', '10'),
  Budget('Above', '10'),
]; 