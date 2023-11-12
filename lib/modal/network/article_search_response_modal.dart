import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:newyorktimes/modal/network/searched_article_modal.dart';

SearchResponseModal articlesListFromJson(String str) => SearchResponseModal.fromJson(json.decode(str));

@JsonSerializable()
class SearchResponseModal {
  String status;
  SearchResponse response;

  SearchResponseModal({
    required this.status,
    required this.response,
  });

  factory SearchResponseModal.fromJson(Map<String, dynamic> json) => SearchResponseModal(
        status: json["status"],
        response: SearchResponse.fromJson(json['response']),
      );
}

class SearchResponse {
  List<SearchedArticle> docs;

  SearchResponse({
    required this.docs,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        docs: json["docs"] == null ? [] : List<SearchedArticle>.from(json["docs"].map((x) => SearchedArticle.fromJson(x))),
      );
}
