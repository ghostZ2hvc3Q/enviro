import 'package:enviro/db/library_provider.dart';
import 'package:enviro/screens/models/book.dart';
import 'package:enviro/textDecoration.dart';
import 'package:flutter/material.dart';
import 'package:enviro/main.dart';
import 'package:enviro/screens/loginScreen.dart';
import 'package:enviro/screens/userPage.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class ViewBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enviro User Page',
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
                print('Back to Admin/User Page');
                Navigator.pop(context);
              },
            ),
            title: Text(
              'View Books',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: BookViewingOptions(),
        ),
      ),
    );
  }
}

class BookViewingOptions extends StatefulWidget {
  @override
  _BookViewingOptionsState createState() => _BookViewingOptionsState();
}

class _BookViewingOptionsState extends State<BookViewingOptions> {
  // getting book list in future

  List bookList; // creating list to get books

  // List<Map> newBookList;
  Future gettingBook() async {
    // loading books into list
    bookList = await LibraryProvider.db.getBooks();
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
    return bookList;
  }

  Widget bookViewList() {
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
              return Card(
                color: itemListColor,
                child: ListTile(
                  leading: Text(snapshot.data[pos]['bid'].toString()),
                  title: Text(snapshot.data[pos]['title']),
                  subtitle: Text(snapshot.data[pos]['author']),
                  trailing: Text(snapshot.data[pos]['genre']),
                ),
              );
            });
      },
      future: gettingBook(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //getter();
    return Container(child: SafeArea(child: bookViewList()));
  }
}
