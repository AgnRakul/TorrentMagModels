// To parse this JSON data, do
//
//     final zooqle = zooqleFromJson(jsonString);

import 'dart:convert';

List<Zooqle> zooqleFromJson(String str) =>
    List<Zooqle>.from(json.decode(str).map((x) => Zooqle.fromJson(x)));

String zooqleToJson(List<Zooqle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Zooqle {
  Zooqle({
    this.name,
    this.size,
    this.dateUploaded,
    this.seeders,
    this.leechers,
    this.url,
    this.magnet,
  });

  String? name;
  String? size;
  DateUploaded? dateUploaded;
  String? seeders;
  String? leechers;
  String? url;
  String? magnet;

  factory Zooqle.fromJson(Map<String, dynamic> json) => Zooqle(
        name: json["Name"],
        size: json["Size"],
        dateUploaded: dateUploadedValues.map![json["DateUploaded"]],
        seeders: json["Seeders"],
        leechers: json["Leechers"],
        url: json["Url"],
        magnet: json["Magnet"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Size": size,
        "DateUploaded": dateUploadedValues.reverse![dateUploaded],
        "Seeders": seeders,
        "Leechers": leechers,
        "Url": url,
        "Magnet": magnet,
      };
}

enum DateUploaded { LONG_AGO, THE_5_MONTHS }

final dateUploadedValues = EnumValues(
    {"long ago": DateUploaded.LONG_AGO, "5 months": DateUploaded.THE_5_MONTHS});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
