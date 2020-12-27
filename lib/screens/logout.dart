import 'package:flutter/material.dart';

import '../textDecoration.dart';

class EnviroLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enviro Logout',
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/EnviroBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              color: textColor,
              onPressed: () {
                print('Back to Admin Page');
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Logout!',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
