import 'package:enviro/db/library_provider.dart';
import 'package:flutter/material.dart';

import '../textDecoration.dart';

class ViewUsers extends StatelessWidget {
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
              'View Users',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: ViewUsersOption(),
        ),
      ),
    );
  }
}

class ViewUsersOption extends StatefulWidget {
  @override
  _ViewUsersOptionState createState() => _ViewUsersOptionState();
}

class _ViewUsersOptionState extends State<ViewUsersOption> {
  List userList;

  Future gettingUsers() async {
    // loading books into list
    userList = await LibraryProvider.db.getUsers();
    // print('\n');
    // print(bookList);
    // for (var book in bookList) {
    // print(book);
    // final anotherBook = Map.from(book);
    // print(book['bid']);
    // print(anotherBook['bid']);
    // }
    // return FutureBuilder(
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.hasData == false &&
    //         snapshot.connectionState == ConnectionState.none) {
    //       return Container(
    //         child: Center(
    //           child: Text(
    //             'Loading...',
    //             style: TextStyle(
    //                 color: textColor,
    //                 fontSize: 40,
    //                 fontStyle: FontStyle.italic),
    //           ),
    //         ),
    //       );
    //     }
    //     return ListView.builder(itemBuilder: (context, pos) {
    //       final book = snapshot.data[pos];
    //       return ListTile(
    //         title: book['title'],
    //       );
    //     });
    //   },
    //   future: bookList,
    // );
    return userList;
  }

  Widget userViewList() {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData == false ||
            snapshot.connectionState == ConnectionState.none) {
          return Container(
            child: Center(
              child: Text(
                'Loading...',
                style: TextStyle(
                    color: textColor,
                    fontSize: 40,
                    fontStyle: FontStyle.italic),
              ),
            ),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, pos) {
              // final book = snapshot.data[pos];
              // print(snapshot.data.length);
              String admin;
              if (snapshot.data[pos]['isAdmin'] == 1) {
                admin = 'Admin';
              } else {
                admin = 'Reader';
              }
              return Card(
                color: itemListColor,
                child: ListTile(
                  leading: Text(snapshot.data[pos]['uid'].toString()),
                  title: Text(snapshot.data[pos]['name']),
                  subtitle: Text(snapshot.data[pos]['email']),
                  trailing: Text(admin),
                ),
              );
            });
      },
      future: gettingUsers(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: userViewList(),
      ),
    );
  }
}
