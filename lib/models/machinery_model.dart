class Machinery {
  late String id;
  late String type;
  late String manufacturer;
  late String model;
  late String status;
  //late String region;
  late String image;

  Machinery(
    this.id,
    this.type,
    this.manufacturer,
    this.model,
    this.status,
    //this.region,
    this.image,
  );
}

////////////////////////////////

class Tractor {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late String status;
  late int year;
  late int horsepower;
  late String hourMeter;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Tractor(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.status,
    this.year,
    this.horsepower,
    this.hourMeter,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class CombineHarvester {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int year;
  late int grainTankCapacity;
  late List<String> grainTypes;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  CombineHarvester(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.year,
    this.grainTankCapacity,
    this.grainTypes,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class Thresher {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int requiredPower;
  late int workingCapacity;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Thresher(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.requiredPower,
    this.workingCapacity,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class Other {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late String additionalInformation;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Other(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.additionalInformation,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class DiscPlough {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int numberOfDiscs;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  DiscPlough(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.numberOfDiscs,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class DiscHarrow {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int numberOfDiscs;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  DiscHarrow(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.numberOfDiscs,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class Planter {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int numberOfRows;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Planter(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.numberOfRows,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class Sprayer {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int tankCapacity;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Sprayer(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.tankCapacity,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class Baler {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int requiredPower;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Baler(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.requiredPower,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class Trailer {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late int loadingCapacity;
  late List<double> platformDimension;
  late double sideboardHeight;
  late int numberOfTires;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  Trailer(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.loadingCapacity,
    this.platformDimension,
    this.sideboardHeight,
    this.numberOfTires,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}

class OtherAttachment {
  late String _id;
  late String ownerId;
  late String type;
  late String manufacturer;
  late String model;
  late String additionalInformation;
  late String region;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;

  OtherAttachment(
    this._id,
    this.ownerId,
    this.type,
    this.manufacturer,
    this.model,
    this.additionalInformation,
    this.region,
    this.image,
    this.createdAt,
    this.updatedAt,
  );
}
