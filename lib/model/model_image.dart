// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<KImage> welcomeFromJson(String str) =>
    List<KImage>.from(json.decode(str).map((x) => KImage.fromJson(x)));

String welcomeToJson(List<KImage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KImage {
  KImage({
    this.albumId,
    this.id,
    this.title,
    required this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory KImage.fromJson(Map<String, dynamic> json) => KImage(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
