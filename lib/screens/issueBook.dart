import 'package:enviro/screens/models/issue.dart';
import 'package:enviro/db/library_provider.dart';
import 'package:enviro/screens/listIssuedBook.dart';
import 'package:flutter/material.dart';

import '../textDecoration.dart';
import 'adminPage.dart';

class IssueBook extends StatelessWidget {
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
              'Issue Book',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: IssueBookServices(),
        ),
      ),
    );
  }
}

class IssueBookServices extends StatefulWidget {
  @override
  _IssueBookServicesState createState() => _IssueBookServicesState();
}

class _IssueBookServicesState extends State<IssueBookServices> {
  // ignore: non_constant_identifier_names
  final _IssueBookForm = GlobalKey<FormState>();
  final iUid = TextEditingController();
  final iBid = TextEditingController();
  final issueDate = TextEditingController();
  final returnDate = TextEditingController();
  final fineData = TextEditingController();
  final periodData = TextEditingController();

  @override
  void dispose() {
    iUid.dispose();
    iBid.dispose();
    issueDate.dispose();
    returnDate.dispose();
    fineData.dispose();
    periodData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _IssueBookForm,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 60,
                child: Card(
                  color: cardColor,
                  child: TextFormField(
                    validator: (value) {
                      // TODO must add logic to check whether user is valid or not(exists or not)
                      if (value.isEmpty) {
                        return 'please enter User Id!';
                      }
                      // var user;
                      // user = LibraryProvider.db.verifyUserId(int.parse(value));
                      // if (user == null) {
                      //   return 'User does not exist.';
                      // }
                      // print(user);
                      return null;
                    },
                    // getting id of user
                    controller: iUid,
                    decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      labelText: 'User Id',
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
                    validator: (value) {
                      // TODO must add logic to check whether book is available or not
                      // var checkBookId =
                      //     LibraryProvider.db.verifyBookId(int.parse(value));
                      // print(checkBookId);
                      if (value.isEmpty) {
                        return 'please enter Book Id!';
                      } //else if (LibraryProvider.db
                      //    .verifyBookId(int.parse(value)) ==
                      // null) {
                      // final ds = iBid.text;
                      // return 'Book with id $ds not exists';
                      // }
                      return null;
                    },
                    // getting id of book
                    controller: iBid,
                    decoration: InputDecoration(
                      icon: Icon(Icons.bookmarks),
                      labelText: 'Book Id',
                    ),
                  ),
                ),
              ),
              // issue date, return date, fine, periods need not to take while issuing book
              // SizedBox(
              //   width: 300,
              //   height: 50,
              //   child: Card(
              //     color: cardColor,
              //     child: TextFormField(
              //       validator: (value) {
              //         if (value.isEmpty) {
              //           return 'please enter Issue date!';
              //         }
              //         return null;
              //       },
              //       // getting title of book
              //       controller: issueDate,
              //       decoration: InputDecoration(
              //         icon: Icon(Icons.date_range),
              //         labelText: 'Issue Date YYYY-MM-DD',
              //         labelStyle: TextStyle(fontSize: 12),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 300,
              //   height: 50,
              //   child: Card(
              //     color: cardColor,
              //     child: TextFormField(
              //       validator: (value) {
              //         if (value.isEmpty) {
              //           return 'please enter return date!';
              //         }
              //         return null;
              //       },
              //       // getting title of book
              //       controller: returnDate,
              //       decoration: InputDecoration(
              //         icon: Icon(Icons.keyboard_return),
              //         labelText: 'Return Date YYYY-MM-DD',
              //         labelStyle: TextStyle(fontSize: 12),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 300,
              //   height: 50,
              //   child: Card(
              //     color: cardColor,
              //     child: TextFormField(
              //       validator: (value) {
              //         if (value.isEmpty) {
              //           return 'please enter fine!';
              //         }
              //         return null;
              //       },
              //       // getting title of book
              //       controller: returnDate,
              //       decoration: InputDecoration(
              //         icon: Icon(Icons.error),
              //         labelText: 'Fine',
              //         labelStyle: TextStyle(fontSize: 12),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 300,
              //   height: 50,
              //   child: Card(
              //     color: cardColor,
              //     child: TextFormField(
              //       validator: (value) {
              //         if (value.isEmpty) {
              //           return 'please enter period!';
              //         }
              //         return null;
              //       },
              //       // getting title of book
              //       controller: returnDate,
              //       decoration: InputDecoration(
              //         icon: Icon(Icons.do_not_step),
              //         labelText: 'Period',
              //         labelStyle: TextStyle(fontSize: 12),
              //       ),
              //     ),
              //   ),
              // ),
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
                            Icons.verified_user,
                            color: Colors.indigo,
                            size: 30,
                          ),
                          title: Text(
                            'Issue',
                            style: TextStyle(
                              color: textColor,
                              fontFamily: 'Quicksand',
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () {
                            print('Pressed Issue book');
                            // perform action to add book info to database
                            if (!_IssueBookForm.currentState.validate()) {
                              return;
                            }
                            _IssueBookForm.currentState.save();

                            print(iUid.text);

                            Issue issue = Issue(
                              iuid: int.parse(iUid.text),
                              ibid: int.parse(iBid.text),
                              issueDate: DateTime.now()
                                  .toString() /*.toString().split(" ")[0]*/,
                              returnDate: " ",
                              fine: 0,
                              // period: 7,
                            );

                            LibraryProvider.db.insertIssue(issue);
                            print('book issued.');

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
                            Icons.view_list,
                            color: Colors.indigo,
                            size: 30,
                          ),
                          title: Text(
                            'Issued Books',
                            style: TextStyle(
                              color: textColor,
                              fontFamily: 'Quicksand',
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () {
                            // navigate to view issued books
                            print('Pressed Issued Books');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ListIssuedBooks();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
