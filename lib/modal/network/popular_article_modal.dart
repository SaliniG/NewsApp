import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

PopularArticle articlesListFromJson(String str) => PopularArticle.fromJson(json.decode(str));

@JsonSerializable()
class PopularArticle {
  String uri;
  String url;
  String source;
  String section;
  String title;
  String byline;
  String abstract;
  List<Media> media;

  PopularArticle({
    required this.uri,
    required this.url,
    required this.source,
    required this.section,
    required this.title,
    required this.byline,
    required this.media,
    required this.abstract,
  });

  factory PopularArticle.fromJson(Map<String, dynamic> json) => PopularArticle(
        url: json["url"],
        uri: json["uri"],
        source: json["source"],
        section: json["section"],
        title: json["title"],
        byline: json["byline"],
        abstract: json["abstract"],
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );
}

class Media {
  String type;
  String subtype;
  List<MediaMetadata> mediaMetadata;

  Media({
    required this.type,
    required this.subtype,
    required this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        subtype: json["subtype"],
        mediaMetadata: json["media-metadata"] == null ? [] : List<MediaMetadata>.from(json["media-metadata"].map((x) => MediaMetadata.fromJson(x))),
      );
}

class MediaMetadata {
  String url;
  String format;
  int height;
  int width;

  MediaMetadata({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  factory MediaMetadata.fromJson(Map<String, dynamic> json) => MediaMetadata(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
      );
}
