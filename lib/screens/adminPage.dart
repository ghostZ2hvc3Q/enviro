// ignore: avoid_web_libraries_in_flutter
// import 'dart:js';

import 'package:enviro/screens/issueBook.dart';
import 'package:enviro/screens/addBook.dart';
import 'package:enviro/screens/listIssuedBook.dart';
import 'package:enviro/screens/returnBook.dart';
import 'package:enviro/screens/viewUsers.dart';
import 'package:enviro/textDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:path/path.dart';
import 'logout.dart';
import 'viewBooks.dart';
import 'addUser.dart';
// import 'package:enviro/screens/userPage.dart';

// ignore: must_be_immutable
class AdminPage extends StatelessWidget {
  // final String userName;
  //
  // AdminPage({Key key, this.userName}) : super(key: key);

  // BuildContext context;
  // TODO add backbutton action to exit app properly
  // Future<bool> _whenBackPressed() {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Really!'),
  //           content: Text('Exit App?'),

  // actions: [
  //   GestureDetector(
  //     onTap: () {
  //       return Future.delayed(const Duration(milliseconds: 1000), () {
  //         SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //       });
  //     },
  //     child: Text('Yep'),
  //   ),
  //   SizedBox(
  //     height: 18,
  //   ),
  //   GestureDetector(
  //     onTap: () => Navigator.of(context).pop(false),
  //     child: Text('Nope'),
  //   )
  // ],
  // );
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enviro Admin Page',
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/EnviroBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: AdminServices(),
        ),
      ),
    );
  }
}

class AdminServices extends StatefulWidget {
  @override
  _AdminServicesState createState() => _AdminServicesState();
}

class _AdminServicesState extends State<AdminServices> {
  Widget adminActionButtonCard(
      IconData icons, String adminAction, Widget route) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 150,
        height: 90,
        child: Card(
          child: Center(
            child: ListTile(
              leading: Icon(
                icons,
                color: Colors.indigo,
                size: 30,
              ),
              title: Text(
                '$adminAction',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Quicksand',
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {
                print('Pressed $adminAction');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return route;
                    },
                  ),
                );
              },
            ),
          ),
          // margin: EdgeInsets.all(10),
          color: cardColor,
          elevation: 4,
          shadowColor: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/EnviroLogo2.png'),
                    width: 100,
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome, ',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                      Text('...')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      adminActionButtonCard(
                          Icons.book, 'View Books', ViewBooks()),
                      adminActionButtonCard(
                          Icons.library_add, 'Add Book', AddBook()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      adminActionButtonCard(Icons.view_carousel_outlined,
                          'View Users', ViewUsers()),
                      adminActionButtonCard(
                          Icons.person_add, 'Add User', AddUser()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      adminActionButtonCard(
                          Icons.send_and_archive, 'Issue Book', IssueBook()),
                      adminActionButtonCard(
                          Icons.assignment, 'Issued Books', ListIssuedBooks()),
                      // adminActionButtonCard(
                      //     Icons.assignment_return, 'Return Book', ReturnBook()),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     adminActionButtonCard(
                  //         Icons.assignment, 'Issued Books', ListIssuedBooks()),
                  //     // adminActionButtonCard(
                  //     //     Icons.logout, 'Logout', EnviroLogout()),
                  //   ],
                  // ),
                  Text(
                    'Enviro',
                    style: TextStyle(
                      color: Color.fromRGBO(60, 11, 82, 1),
                      fontSize: 70,
                      fontFamily: 'Quicksand',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'powered by ',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Color.fromRGBO(65, 49, 99, 1),
                        ),
                      ),
                      Text(
                        'hwarecom',
                        style: TextStyle(color: Color.fromRGBO(65, 49, 99, 1)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
