import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:newyorktimes/modal/network/article_search_response_modal.dart';
import 'package:newyorktimes/modal/network/most_popular_response_modal.dart';
import 'package:newyorktimes/modal/ui/news_modal.dart';
import 'package:newyorktimes/resource/service.dart';
import 'package:newyorktimes/utils/mapper.dart';

class ProviderClass extends ChangeNotifier {
  List<News> _newsList = [];
  bool isSearch = false;
  bool isListView = true;
  String searchQuery = "";
  List<String> sectionList = [];

  String filter = "";

  bool get getSearchText => isSearch;

  set setSearchText(bool status) {
    isSearch = status;
    notifyListeners();
  }

  String get getSearchQuery => searchQuery;

  set setSearchQuery(String value) {
    searchQuery = value;
    notifyListeners();
  }

  String get getFilter => filter;

  set setFilter(String value) {
    filter = value;
    notifyListeners();
  }

  bool get getListViewStatus => isListView;

  set setListViewStatus(bool status) {
    isListView = status;
    notifyListeners();
  }

  List<News> get newsList => _newsList;

  set setNewsList(List<News> value) {
    _newsList = value;
  }

  List<String> get getSectionList => sectionList;

  set setSectionList(List<String> value) {
    sectionList = value;
  }

  Future<Response> fetchArticleDetails() async {
    try {
      setNewsList = [];
      setSearchText = false;
      Response response = await Service.fetchArticleDetailsData();
      final responseBody = jsonDecode(response.body);
      setNewsList = mapFromPopularToNews(MostPopularResponseModal.fromJson(responseBody));
      List<String> sections = [];
      for (var element in newsList) {
        sections.add(element.section);
      }
      setSectionList = sections;
      notifyListeners();
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> searchFilterArticleDetails({required String searchString, required String filter}) async {
    try {
      setNewsList = [];
      setFilter = filter;
      setSearchQuery = searchString;
      Response response = await Service.searchArticleData(searchString: searchString, filter: filter);
      final responseBody = jsonDecode(response.body);
      setNewsList = mapFromSearchedToNews(SearchResponseModal.fromJson(responseBody));
      notifyListeners();

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
