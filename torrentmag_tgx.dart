// To parse this JSON data, do
//
//     final tgx = tgxFromJson(jsonString);

import 'dart:convert';

List<Tgx> tgxFromJson(String str) =>
    List<Tgx>.from(json.decode(str).map((x) => Tgx.fromJson(x)));

String tgxToJson(List<Tgx> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tgx {
  Tgx({
    this.name,
    this.poster,
    this.category,
    this.url,
    this.uploadedBy,
    this.size,
    this.seeders,
    this.leechers,
    this.dateUploaded,
    this.torrent,
    this.magnet,
  });

  String? name;
  String? poster;
  Category? category;
  String? url;
  String? uploadedBy;
  String? size;
  String? seeders;
  String? leechers;
  String? dateUploaded;
  String? torrent;
  String? magnet;

  factory Tgx.fromJson(Map<String, dynamic> json) => Tgx(
        name: json["Name"],
        poster: json["Poster"],
        category: categoryValues.map![json["Category"]],
        url: json["Url"],
        uploadedBy: json["UploadedBy"],
        size: json["Size"],
        seeders: json["Seeders"],
        leechers: json["Leechers"],
        dateUploaded: json["DateUploaded"],
        torrent: json["Torrent"],
        magnet: json["Magnet"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Poster": poster,
        "Category": categoryValues.reverse![category],
        "Url": url,
        "UploadedBy": uploadedBy,
        "Size": size,
        "Seeders": seeders,
        "Leechers": leechers,
        "DateUploaded": dateUploaded,
        "Torrent": torrent,
        "Magnet": magnet,
      };
}

enum Category {
  MOVIES_HD,
  MUSIC_LOSSLESS,
  MUSIC_ALBUMS,
  BOOKS_COMICS,
  MOVIES_PACKS,
  MOVIES_4_K_UHD
}

final categoryValues = EnumValues({
  "Books : Comics": Category.BOOKS_COMICS,
  "Movies : 4K UHD": Category.MOVIES_4_K_UHD,
  "Movies : HD": Category.MOVIES_HD,
  "Movies : Packs": Category.MOVIES_PACKS,
  "Music : Albums": Category.MUSIC_ALBUMS,
  "Music : Lossless": Category.MUSIC_LOSSLESS
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
