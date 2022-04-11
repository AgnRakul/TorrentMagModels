// To parse this JSON data, do
//
//     final the1337X = the1337XFromJson(jsonString);

import 'dart:convert';

List<The1337X> the1337XFromJson(String str) =>
    List<The1337X>.from(json.decode(str).map((x) => The1337X.fromJson(x)));

String the1337XToJson(List<The1337X> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class The1337X {
  The1337X({
    this.name,
    this.magnet,
    this.poster,
    this.category,
    this.type,
    this.language,
    this.size,
    this.uploadedBy,
    this.downloads,
    this.lastChecked,
    this.dateUploaded,
    this.seeders,
    this.leechers,
    this.url,
  });

  String? name;
  String? magnet;
  Poster? poster;
  Category? category;
  Type? type;
  Language? language;
  String? size;
  String? uploadedBy;
  String? downloads;
  String? lastChecked;
  String? dateUploaded;
  String? seeders;
  String? leechers;
  String? url;

  factory The1337X.fromJson(Map<String, dynamic> json) => The1337X(
        name: json["Name"],
        magnet: json["Magnet"],
        poster: posterValues.map![json["Poster"]],
        category: categoryValues.map![json["Category"]],
        type: typeValues.map![json["Type"]],
        language: languageValues.map![json["Language"]],
        size: json["Size"],
        uploadedBy: json["UploadedBy"],
        downloads: json["Downloads"],
        lastChecked: json["LastChecked"],
        dateUploaded: json["DateUploaded"],
        seeders: json["Seeders"],
        leechers: json["Leechers"],
        url: json["Url"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Magnet": magnet,
        "Poster": posterValues.reverse![poster],
        "Category": categoryValues.reverse![category],
        "Type": typeValues.reverse![type],
        "Language": languageValues.reverse![language],
        "Size": size,
        "UploadedBy": uploadedBy,
        "Downloads": downloads,
        "LastChecked": lastChecked,
        "DateUploaded": dateUploaded,
        "Seeders": seeders,
        "Leechers": leechers,
        "Url": url,
      };
}

enum Category { MOVIES }

final categoryValues = EnumValues({"Movies": Category.MOVIES});

enum Language { ENGLISH }

final languageValues = EnumValues({"English": Language.ENGLISH});

enum Poster {
  HTTPS_IMG_MOVIE_AVENGERS_INFINITY_WAR_2018_JPG,
  HTTPS_IMG_MOVIE_UNTITLED_AVENGERS_MOVIE_2019_JPG,
  HTTPS_IMG_MOVIE_THE_AVENGERS_2012_JPG,
  EMPTY
}

final posterValues = EnumValues({
  "": Poster.EMPTY,
  "https:/img/movie/Avengers-Infinity-War-2018.jpg":
      Poster.HTTPS_IMG_MOVIE_AVENGERS_INFINITY_WAR_2018_JPG,
  "https:/img/movie/The-Avengers-2012.jpg":
      Poster.HTTPS_IMG_MOVIE_THE_AVENGERS_2012_JPG,
  "https:/img/movie/Untitled-Avengers-Movie-2019.jpg":
      Poster.HTTPS_IMG_MOVIE_UNTITLED_AVENGERS_MOVIE_2019_JPG
});

enum Type { HD, HEVC_X265, H_264_X264, DIVX_XVID }

final typeValues = EnumValues({
  "Divx/Xvid": Type.DIVX_XVID,
  "HD": Type.HD,
  "HEVC/x265": Type.HEVC_X265,
  "h.264/x264": Type.H_264_X264
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
