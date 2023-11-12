import 'package:flutter/material.dart';
import 'package:newyorktimes/modal/ui/filter_modal.dart';
import 'package:newyorktimes/resource/provider.dart';
import 'package:newyorktimes/utils/constants.dart';
import 'package:newyorktimes/utils/styles.dart';

Future<String?> filterMenu(BuildContext context, List<Filter> filterList, ProviderClass providerClass) {
  const RelativeRect position = RelativeRect.fromLTRB(70, 90, 50, 0);
  return showMenu(
      context: context,
      items: filterList
          .toSet()
          .map((item) => PopupMenuItem<String>(
                onTap: () {
                  providerClass.searchFilterArticleDetails(searchString: providerClass.getSearchQuery, filter: item.value);
                },
                value: item.value,
                child: Text(
                  item.name,
                  style: providerClass.getFilter == item.name
                      ? selectedTextStyle
                      : item.name == AppConstants.clearText
                          ? clearTextStyle
                          : commonTextFieldStyle,
                ),
              ))
          .toList(),
      position: position);
}
