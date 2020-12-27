// TODO custom action app bar someone create it with proper route setting

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../textDecoration.dart';

// AppBar actionPageAppBar = AppBar(
// backgroundColor: Colors.transparent,
// elevation: 0,
// leading: BackButton(
// color: textColor,
// onPressed: () {
// print('Back to Admin Page');
// },
// ),
// title: Text(
// 'Add Book',
// style: appBarTitle,
// ),
// );

Widget actionPageAppBarCreation(
  String titleName,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      '$titleName',
      style: appBarTitle,
    ),
  );
}
