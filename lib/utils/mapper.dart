import 'package:newyorktimes/modal/network/article_search_response_modal.dart';
import 'package:newyorktimes/modal/network/most_popular_response_modal.dart';
import 'package:newyorktimes/modal/ui/news_modal.dart';

List<News> mapFromPopularToNews(MostPopularResponseModal responseModal) {
  return responseModal.articles
      .map((e) => News(
            title: e.title,
            description: e.abstract,
            author: e.byline,
            url: e.url,
            section: e.section,
            thumbNail: e.media.firstOrNull?.mediaMetadata.firstWhere((element) => element.format == "Standard Thumbnail").url,
            image: e.media.firstOrNull?.mediaMetadata.firstWhere((element) => element.format == "mediumThreeByTwo440").url,
          ))
      .toList(growable: false);
}

List<News> mapFromSearchedToNews(SearchResponseModal responseModal) {
  return responseModal.response.docs
      .map((e) => News(
            title: e.headline.main,
            description: e.abstract,
            author: e.byLine?.original ?? "",
            url: e.url,
            section: e.section,
            thumbNail: e.multiMedia.firstOrNull == null ? null : "https://static01.nyt.com/${e.multiMedia.firstOrNull!.url}",
            image: e.multiMedia.firstOrNull == null ? null : "https://static01.nyt.com/${e.multiMedia.firstOrNull!.url}",
          ))
      .toList(growable: false);
}
