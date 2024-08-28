class AutoCompleteRes {
  AutoCompleteRes({
    this.predictions,
    this.status,
  });

  List<Prediction>? predictions;
  dynamic status;

  factory AutoCompleteRes.fromMap(Map<String, dynamic> json) => AutoCompleteRes(
        predictions: json["predictions"] == null
            ? null
            : List<Prediction>.from(
                json["predictions"].map((x) => Prediction.fromMap(x))),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "predictions": predictions == null
            ? null
            : List<dynamic>.from(predictions!.map((x) => x.toMap())),
        "status": status,
      };
}

class Prediction {
  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  dynamic description;
  List<MatchedSubstring>? matchedSubstrings;
  dynamic placeId;
  dynamic reference;
  StructuredFormatting? structuredFormatting;
  List<Term>? terms;
  List<String>? types;

  factory Prediction.fromMap(Map<String, dynamic> json) => Prediction(
        description: json["description"],
        matchedSubstrings: json["matched_substrings"] == null
            ? null
            : List<MatchedSubstring>.from(json["matched_substrings"]
                .map((x) => MatchedSubstring.fromMap(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        structuredFormatting: json["structured_formatting"] == null
            ? null
            : StructuredFormatting.fromMap(json["structured_formatting"]),
        terms: json["terms"] == null
            ? null
            : List<Term>.from(json["terms"].map((x) => Term.fromMap(x))),
        types: json["types"] == null
            ? null
            : List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "matched_substrings": matchedSubstrings == null
            ? null
            : List<dynamic>.from(matchedSubstrings!.map((x) => x.toMap())),
        "place_id": placeId,
        "reference": reference,
        "structured_formatting":
            structuredFormatting == null ? null : structuredFormatting!.toMap(),
        "terms": terms == null
            ? null
            : List<dynamic>.from(terms!.map((x) => x.toMap())),
        "types":
            types == null ? null : List<dynamic>.from(types!.map((x) => x)),
      };
}

class MatchedSubstring {
  MatchedSubstring({
    this.length,
    this.offset,
  });

  dynamic length;
  dynamic offset;

  factory MatchedSubstring.fromMap(Map<String, dynamic> json) =>
      MatchedSubstring(
        length: json["length"],
        offset: json["offset"],
      );

  Map<String, dynamic> toMap() => {
        "length": length,
        "offset": offset,
      };
}

class StructuredFormatting {
  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  dynamic mainText;
  List<MatchedSubstring>? mainTextMatchedSubstrings;
  dynamic secondaryText;

  factory StructuredFormatting.fromMap(Map<String, dynamic> json) =>
      StructuredFormatting(
        mainText: json["main_text"],
        mainTextMatchedSubstrings: json["main_text_matched_substrings"] == null
            ? null
            : List<MatchedSubstring>.from(json["main_text_matched_substrings"]
                .map((x) => MatchedSubstring.fromMap(x))),
        secondaryText: json["secondary_text"],
      );

  Map<String, dynamic> toMap() => {
        "main_text": mainText,
        "main_text_matched_substrings": mainTextMatchedSubstrings == null
            ? null
            : List<dynamic>.from(
                mainTextMatchedSubstrings!.map((x) => x.toMap())),
        "secondary_text": secondaryText,
      };
}

class Term {
  Term({
    this.offset,
    this.value,
  });

  dynamic offset;
  dynamic value;

  factory Term.fromMap(Map<String, dynamic> json) => Term(
        offset: json["offset"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "value": value,
      };
}
