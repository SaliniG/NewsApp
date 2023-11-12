import 'package:flutter/material.dart';
import 'package:newyorktimes/utils/colors.dart';

Widget circularLoading() {
  return const CircularProgressIndicator(
    backgroundColor: brandColor,
    valueColor: AlwaysStoppedAnimation<Color>(
      Colors.white,
    ),
  );
}
