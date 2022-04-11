// To parse this JSON data, do
//
//     final eztv = eztvFromJson(jsonString);

import 'dart:convert';

List<Eztv> eztvFromJson(String str) => List<Eztv>.from(json.decode(str).map((x) => Eztv.fromJson(x)));

String eztvToJson(List<Eztv> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Eztv {
    Eztv({
        this.name,
        this.size,
        this.dateUploaded,
        this.seeders,
        this.url,
        this.torrent,
        this.magnet,
    });

    String? name;
    String? size;
    DateUploaded? dateUploaded;
    String? seeders;
    String? url;
    String? torrent;
    String? magnet;

    factory Eztv.fromJson(Map<String, dynamic> json) => Eztv(
        name: json["Name"],
        size: json["Size"],
        dateUploaded: dateUploadedValues.map![json["DateUploaded"]],
        seeders: json["Seeders"],
        url: json["Url"],
        torrent: json["Torrent"] == null ? null : json["Torrent"],
        magnet: json["Magnet"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Size": size,
        "DateUploaded": dateUploadedValues.reverse![dateUploaded],
        "Seeders": seeders,
        "Url": url,
        "Torrent": torrent == null ? null : torrent,
        "Magnet": magnet,
    };
}

enum DateUploaded { THE_1_MO, THE_1_YEAR, THE_3_YEARS, THE_4_YEARS, THE_6_YEARS, THE_8_YEARS, THE_10_YEARS }

final dateUploadedValues = EnumValues({
    "10 years": DateUploaded.THE_10_YEARS,
    "1 mo": DateUploaded.THE_1_MO,
    "1 year": DateUploaded.THE_1_YEAR,
    "3 years": DateUploaded.THE_3_YEARS,
    "4 years": DateUploaded.THE_4_YEARS,
    "6 years": DateUploaded.THE_6_YEARS,
    "8 years": DateUploaded.THE_8_YEARS
});

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
