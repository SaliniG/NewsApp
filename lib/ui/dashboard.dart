import 'package:flutter/material.dart';
import 'package:newyorktimes/common_widget/circular_loading.dart';
import 'package:newyorktimes/modal/ui/filter_modal.dart';
import 'package:newyorktimes/resource/provider.dart';
import 'package:newyorktimes/ui/widget/filter_menu.dart';
import 'package:newyorktimes/ui/widget/news_list.dart';
import 'package:newyorktimes/utils/constants.dart';
import 'package:newyorktimes/utils/styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routerPath = '/homeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProviderClass providerClass;

  @override
  void initState() {
    super.initState();
    providerClass = Provider.of<ProviderClass>(context, listen: false);
    providerClass.fetchArticleDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<ProviderClass>(builder: (context, state, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 230,
                      height: 35,
                      child: TextField(
                        maxLines: null,
                        onSubmitted: (value) {
                          if (value.isEmpty) {
                            providerClass.fetchArticleDetails();
                          } else {
                            providerClass.searchFilterArticleDetails(searchString: value, filter: providerClass.getFilter);
                            providerClass.setSearchText = true;
                          }
                        },
                        textInputAction: TextInputAction.go,
                        style: autoCompleteTextStyle,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search',
                          hintStyle: searchHintTextStyle,
                          suffixIcon: const IconButton(
                            icon: Icon(Icons.search),
                            onPressed: null,
                            splashRadius: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        List<Filter> filters = providerClass.getSectionList.map((e) => Filter(name: e, value: e)).toList();
                        filters.add(Filter(name: AppConstants.clearText, value: ""));
                        filterMenu(context, filters, providerClass);
                        providerClass.setSearchText = true;
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.filter_alt_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Filter',
                            style: headlineTextStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        providerClass.setListViewStatus = true;
                      },
                      child: const Icon(
                        Icons.list_rounded,
                        size: 25,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        providerClass.setListViewStatus = false;
                      },
                      child: const Icon(
                        Icons.grid_view_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Selector<ProviderClass, bool>(
                  selector: (p0, provider) => provider.isSearch,
                  builder: (context, _, __) {
                    return providerClass.newsList.isEmpty
                        ? Expanded(
                            child: Center(
                              child: circularLoading(),
                            ),
                          )
                        : NewsList(newsList: providerClass.newsList);
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
