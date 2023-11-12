import 'package:flutter/material.dart';
import 'package:newyorktimes/modal/ui/news_modal.dart';
import 'package:newyorktimes/resource/provider.dart';
import 'package:newyorktimes/ui/news_details_screen.dart';
import 'package:newyorktimes/utils/styles.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NewsList extends StatefulWidget {
  List<News> newsList;

  NewsList({required this.newsList, Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late ProviderClass providerClass;

  @override
  void initState() {
    super.initState();
    providerClass = Provider.of<ProviderClass>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProviderClass, bool>(
      selector: (p0, provider) => provider.isListView,
      builder: (context, _, __) {
        return Expanded(
          child: providerClass.isListView
              ? ListView.builder(
                  itemCount: widget.newsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailsScreen(news: widget.newsList[index])));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ListTile(
                            leading: widget.newsList[index].thumbNail?.isNotEmpty == true
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Image(
                                        image: NetworkImage(widget.newsList[index].thumbNail!),
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 75,
                                    width: 75,
                                  ),
                            title: Text(
                              maxLines: 2,
                              widget.newsList[index].title,
                              style: titleTextStyle,
                            ),
                            subtitle: Text(
                              overflow: TextOverflow.ellipsis,
                              widget.newsList[index].author.isNotEmpty ? widget.newsList[index].author : "By Unknown",
                              style: italicText,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2),
                  itemCount: widget.newsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailsScreen(news: widget.newsList[index])));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.newsList[index].thumbNail?.isNotEmpty == true
                                  ? SizedBox(
                                      height: 110,
                                      width: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image(
                                          image: NetworkImage(widget.newsList[index].thumbNail!),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 110,
                                      width: 220,
                                    ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      widget.newsList[index].title,
                                      style: titleTextStyle,
                                    ),
                                    /*const SizedBox(
                                      height: 2,
                                    ),*/
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      widget.newsList[index].author.isNotEmpty ? widget.newsList[index].author : "By Unknown",
                                      style: autoCompleteTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
