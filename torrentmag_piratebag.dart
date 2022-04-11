// To parse this JSON data, do
//
//     final pirateBay = pirateBayFromJson(jsonString);

import 'dart:convert';

List<PirateBay> pirateBayFromJson(String str) =>
    List<PirateBay>.from(json.decode(str).map((x) => PirateBay.fromJson(x)));

String pirateBayToJson(List<PirateBay> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PirateBay {
  PirateBay({
    this.name,
    this.size,
    this.dateUploaded,
    this.category,
    this.seeders,
    this.leechers,
    this.uploadedBy,
    this.url,
    this.magnet,
  });

  String? name;
  String? size;
  String? dateUploaded;
  Category? category;
  String? seeders;
  String? leechers;
  String? uploadedBy;
  String? url;
  String? magnet;

  factory PirateBay.fromJson(Map<String, dynamic> json) => PirateBay(
        name: json["Name"],
        size: json["Size"],
        dateUploaded: json["DateUploaded"],
        category: categoryValues.map![json["Category"]],
        seeders: json["Seeders"],
        leechers: json["Leechers"],
        uploadedBy: json["UploadedBy"],
        url: json["Url"],
        magnet: json["Magnet"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Size": size,
        "DateUploaded": dateUploaded,
        "Category": categoryValues.reverse![category],
        "Seeders": seeders,
        "Leechers": leechers,
        "UploadedBy": uploadedBy,
        "Url": url,
        "Magnet": magnet,
      };
}

enum Category { VIDEO, PORN }

final categoryValues =
    EnumValues({"Porn": Category.PORN, "Video": Category.VIDEO});

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
