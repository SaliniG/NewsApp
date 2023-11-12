import 'package:flutter/material.dart';
import 'package:newyorktimes/modal/ui/news_modal.dart';
import 'package:newyorktimes/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NewsDetailsScreen extends StatefulWidget {
  static const routerPath = '/articlesDetailsScreen';
  News news;

  NewsDetailsScreen({required this.news, Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          textAlign: TextAlign.center,
          'Details',
          style: headlineTextStyleBold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              if (widget.news.image?.isNotEmpty == true)
                Image(
                  image: NetworkImage(widget.news.image!),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.news.title,
                      style: headlineTextStyleBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.news.description,
                      style: autoCompleteTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.news.author.isNotEmpty ? widget.news.author : 'By Unknown',
                      style: italicText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => launchUrl(Uri.parse(widget.news.url)),
                      child: const Text(
                        'See More..',
                        style: autoCompleteUnderLineTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
