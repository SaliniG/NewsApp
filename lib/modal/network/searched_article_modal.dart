import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

SearchedArticle articlesListFromJson(String str) => SearchedArticle.fromJson(json.decode(str));

@JsonSerializable()
class SearchedArticle {
  String abstract;
  String url;
  String source;
  String section;
  List<MultiMedia> multiMedia;
  Headline headline;
  ByLine? byLine;

  SearchedArticle({
    required this.abstract,
    required this.url,
    required this.source,
    required this.section,
    required this.multiMedia,
    required this.headline,
    required this.byLine,
  });

  factory SearchedArticle.fromJson(Map<String, dynamic> json) => SearchedArticle(
        abstract: json["abstract"],
        url: json["web_url"],
        source: json["source"],
        section: json["section_name"],
        multiMedia: json["multimedia"] == null ? [] : List<MultiMedia>.from(json["multimedia"].map((x) => MultiMedia.fromJson(x))),
        headline: Headline.fromJson(json["headline"]),
        byLine: json["byline"] == null ? null : ByLine.fromJson(json["byline"]),
      );
}

class MultiMedia {
  String subtype;
  String url;

  MultiMedia({
    required this.subtype,
    required this.url,
  });

  factory MultiMedia.fromJson(Map<String, dynamic> json) => MultiMedia(
        subtype: json["subtype"],
        url: json["url"],
      );
}

class Headline {
  String main;

  Headline({
    required this.main,
  });

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        main: json["main"],
      );
}

class ByLine {
  String? original;

  ByLine({
    required this.original,
  });

  factory ByLine.fromJson(Map<String, dynamic> json) => ByLine(
        original: json["original"],
      );
}
