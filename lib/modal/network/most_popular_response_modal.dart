import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:newyorktimes/modal/network/popular_article_modal.dart';

MostPopularResponseModal mostPopularListFromJson(String str) => MostPopularResponseModal.fromJson(json.decode(str));

@JsonSerializable()
class MostPopularResponseModal {
  String status;
  int numResults;
  List<PopularArticle> articles;

  MostPopularResponseModal({required this.status, required this.numResults, required this.articles});

  factory MostPopularResponseModal.fromJson(Map<String, dynamic> json) => MostPopularResponseModal(
        status: json["status"],
        numResults: json["num_results"],
        articles: json["results"] == null ? [] : List<PopularArticle>.from(json["results"]!.map((x) => PopularArticle.fromJson(x))),
      );
}
