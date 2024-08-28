class GeoCodeRes {
  GeoCodeRes({
    this.plusCode,
    this.results,
    this.status,
  });

  PlusCode? plusCode;
  List<Result>? results;
  dynamic status;

  factory GeoCodeRes.fromMap(Map<String, dynamic> json) => GeoCodeRes(
    plusCode: json["plus_code"] == null
        ? null
        : PlusCode.fromMap(json["plus_code"]),
    results: json["results"] == null
        ? null
        : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "plus_code": plusCode == null ? null : plusCode!.toMap(),
    "results": results == null
        ? null
        : List<dynamic>.from(results!.map((x) => x.toMap())),
    "status": status == null ? null : status,
  };
}

class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  dynamic compoundCode;
  dynamic globalCode;

  factory PlusCode.fromMap(Map<String, dynamic> json) => PlusCode(
    compoundCode:
    json["compound_code"] == null ? null : json["compound_code"],
    globalCode: json["global_code"] == null ? null : json["global_code"],
  );

  Map<String, dynamic> toMap() => {
    "compound_code": compoundCode == null ? null : compoundCode,
    "global_code": globalCode == null ? null : globalCode,
  };
}

class Result {
  Result({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.types,
    this.plusCode,
  });

  List<AddressComponent>? addressComponents;
  dynamic formattedAddress;
  Geometry? geometry;
  dynamic placeId;
  List<String>? types;
  PlusCode? plusCode;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    addressComponents: json["address_components"] == null
        ? null
        : List<AddressComponent>.from(json["address_components"]
        .map((x) => AddressComponent.fromMap(x))),
    formattedAddress: json["formatted_address"] == null
        ? null
        : json["formatted_address"],
    geometry: json["geometry"] == null
        ? null
        : Geometry.fromMap(json["geometry"]),
    placeId: json["place_id"] == null ? null : json["place_id"],
    types: json["types"] == null
        ? null
        : List<String>.from(json["types"].map((x) => x)),
    plusCode: json["plus_code"] == null
        ? null
        : PlusCode.fromMap(json["plus_code"]),
  );

  Map<String, dynamic> toMap() => {
    "address_components": addressComponents == null
        ? null
        : List<dynamic>.from(addressComponents!.map((x) => x.toMap())),
    "formatted_address": formattedAddress == null ? null : formattedAddress,
    "geometry": geometry == null ? null : geometry!.toMap(),
    "place_id": placeId == null ? null : placeId,
    "types":
    types == null ? null : List<dynamic>.from(types!.map((x) => x)),
    "plus_code": plusCode == null ? null : plusCode!.toMap(),
  };
}

class AddressComponent {
  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  dynamic longName;
  dynamic shortName;
  List<String>? types;

  factory AddressComponent.fromMap(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json["long_name"] == null ? null : json["long_name"],
        shortName: json["short_name"] == null ? null : json["short_name"],
        types: json["types"] == null
            ? null
            : List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
    "long_name": longName == null ? null : longName,
    "short_name": shortName == null ? null : shortName,
    "types":
    types == null ? null : List<dynamic>.from(types!.map((x) => x)),
  };
}

class Geometry {
  Geometry({
    this.location,
    this.locationType,
    this.viewport,
    this.bounds,
  });

  Location? location;
  dynamic locationType;
  Bounds? viewport;
  Bounds? bounds;

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
    location: json["location"] == null
        ? null
        : Location.fromMap(json["location"]),
    locationType:
    json["location_type"] == null ? null : json["location_type"],
    viewport:
    json["viewport"] == null ? null : Bounds.fromMap(json["viewport"]),
    bounds: json["bounds"] == null ? null : Bounds.fromMap(json["bounds"]),
  );

  Map<String, dynamic> toMap() => {
    "location": location == null ? null : location!.toMap(),
    "location_type": locationType == null ? null : locationType,
    "viewport": viewport == null ? null : viewport!.toMap(),
    "bounds": bounds == null ? null : bounds!.toMap(),
  };
}

class Bounds {
  Bounds({
    this.northeast,
    this.southwest,
  });

  Location? northeast;
  Location? southwest;

  factory Bounds.fromMap(Map<String, dynamic> json) => Bounds(
    northeast: json["northeast"] == null
        ? null
        : Location.fromMap(json["northeast"]),
    southwest: json["southwest"] == null
        ? null
        : Location.fromMap(json["southwest"]),
  );

  Map<String, dynamic> toMap() => {
    "northeast": northeast == null ? null : northeast!.toMap(),
    "southwest": southwest == null ? null : southwest!.toMap(),
  };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  dynamic lat;
  dynamic lng;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lng: json["lng"] == null ? null : json["lng"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
  };
}
