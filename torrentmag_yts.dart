// To parse this JSON data, do
//
//     final yts = ytsFromJson(jsonString);

import 'dart:convert';

List<Yts> ytsFromJson(String str) =>
    List<Yts>.from(json.decode(str).map((x) => Yts.fromJson(x)));

String ytsToJson(List<Yts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Yts {
  Yts({
    this.name,
    this.releasedDate,
    this.genre,
    this.rating,
    this.likes,
    this.runtime,
    this.language,
    this.url,
    this.poster,
    this.files,
  });

  String? name;
  String? releasedDate;
  String? genre;
  Rating? rating;
  String? likes;
  String? runtime;
  Language? language;
  String? url;
  String? poster;
  List<FileElement>? files;

  factory Yts.fromJson(Map<String, dynamic> json) => Yts(
        name: json["Name"],
        releasedDate: json["ReleasedDate"],
        genre: json["Genre"],
        rating: ratingValues.map![json["Rating"]],
        likes: json["Likes"],
        runtime: json["Runtime"],
        language: languageValues.map![json["Language"]],
        url: json["Url"],
        poster: json["Poster"],
        files: List<FileElement>.from(
            json["Files"].map((x) => FileElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "ReleasedDate": releasedDate,
        "Genre": genre,
        "Rating": ratingValues.reverse![rating],
        "Likes": likes,
        "Runtime": runtime,
        "Language": languageValues.reverse![language],
        "Url": url,
        "Poster": poster,
        "Files": List<dynamic>.from(files!.map((x) => x.toJson())),
      };
}

class FileElement {
  FileElement({
    this.quality,
    this.type,
    this.size,
    this.torrent,
    this.magnet,
  });

  Quality? quality;
  Type? type;
  String? size;
  String? torrent;
  String? magnet;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        quality: qualityValues.map![json["Quality"]],
        type: typeValues.map![json["Type"]],
        size: json["Size"],
        torrent: json["Torrent"],
        magnet: json["Magnet"],
      );

  Map<String, dynamic> toJson() => {
        "Quality": qualityValues.reverse![quality],
        "Type": typeValues.reverse![type],
        "Size": size,
        "Torrent": torrent,
        "Magnet": magnet,
      };
}

enum Quality { THE_720_P, THE_1080_P, THE_3_D, THE_2160_P }

final qualityValues = EnumValues({
  "1080p": Quality.THE_1080_P,
  "2160p": Quality.THE_2160_P,
  "3D": Quality.THE_3_D,
  "720p": Quality.THE_720_P
});

enum Type { BLU_RAY, WEB }

final typeValues = EnumValues({"BluRay": Type.BLU_RAY, "WEB": Type.WEB});

enum Language { ITALIAN_20, ENGLISH_20, CHINESE_20 }

final languageValues = EnumValues({
  "Chinese 2.0": Language.CHINESE_20,
  "English 2.0": Language.ENGLISH_20,
  "Italian 2.0": Language.ITALIAN_20
});

enum Rating { EMPTY, THE_78, THE_84, THE_81 }

final ratingValues = EnumValues({
  "⭐": Rating.EMPTY,
  "7.8 ⭐": Rating.THE_78,
  "8.1 ⭐": Rating.THE_81,
  "8.4 ⭐": Rating.THE_84
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
