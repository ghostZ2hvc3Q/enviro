import 'package:enviro/db/library_provider.dart';
import 'package:enviro/screens/models/book.dart';
import 'package:enviro/screens/adminPage.dart';
import 'package:enviro/screens/viewBooks.dart';
import 'package:enviro/textDecoration.dart';
import 'package:flutter/material.dart';

class AddBook extends StatelessWidget {
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
              'Add Book',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: AddBookService(),
        ),
      ),
    );
  }
}

class AddBookService extends StatefulWidget {
  @override
  _AddBookServiceState createState() => _AddBookServiceState();
}

class _AddBookServiceState extends State<AddBookService> {
  final _bookForm = GlobalKey<FormState>();
  final bookTitle = TextEditingController();
  final bookAuthor = TextEditingController();
  final bookGenre = TextEditingController();
  @override
  void dispose() {
    bookTitle.dispose();
    bookAuthor.dispose();
    bookGenre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bookForm,
      child: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              // Text Fields for books info
              children: [
                SizedBox(
                  width: 300,
                  height: 60,
                  child: Card(
                    color: cardColor,
                    child: TextFormField(
                      // key: _bookForm,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter title!';
                        }
                        return null;
                      },
                      // getting title of book
                      controller: bookTitle,
                      decoration: InputDecoration(
                        icon: Icon(Icons.title_sharp),
                        labelText: 'Book title',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: Card(
                    color: cardColor,
                    child: TextFormField(
                      // key: _bookForm,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter author name!';
                        }
                        return null;
                      },
                      // getting author of book
                      controller: bookAuthor,
                      decoration: InputDecoration(
                        icon: Icon(Icons.title_sharp),
                        labelText: 'Author Name',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: Card(
                    color: cardColor,
                    child: TextFormField(
                      // key: _bookForm,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter genre!';
                        }
                        return null;
                      },
                      // Highlight: getting genre of book
                      controller: bookGenre,
                      decoration: InputDecoration(
                        icon: Icon(Icons.title_sharp),
                        labelText: 'Genre',
                      ),
                    ),
                  ),
                ),
                // ListTile to perform action to add and view button
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 60,
                      child: Card(
                        child: Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.add_box,
                              color: Colors.indigo,
                              size: 30,
                            ),
                            title: Text(
                              'Add',
                              style: TextStyle(
                                color: textColor,
                                fontFamily: 'Quicksand',
                                fontStyle: FontStyle.italic,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              print('Pressed Add book');
                              // perform action to add book info to database
                              if (!_bookForm.currentState.validate()) {
                                print('Not Valid');
                                return;
                              }
                              _bookForm.currentState.save();

                              print(bookTitle.text);
                              Book book = Book(
                                  title: bookTitle.text,
                                  author: bookAuthor.text,
                                  genre: bookGenre.text);

                              LibraryProvider.db.insertBook(book);
                              print('book added.');

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AdminPage();
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
                    SizedBox(
                      width: 150,
                      height: 60,
                      child: Card(
                        child: Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.view_agenda_outlined,
                              color: Colors.indigo,
                              size: 30,
                            ),
                            title: Text(
                              'Books',
                              style: TextStyle(
                                color: textColor,
                                fontFamily: 'Quicksand',
                                fontStyle: FontStyle.italic,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              // navigate to view books
                              print('Pressed View Books');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ViewBooks();
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
