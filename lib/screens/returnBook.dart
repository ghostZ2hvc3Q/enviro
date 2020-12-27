import 'package:enviro/db/library_provider.dart';
import 'package:enviro/screens/adminPage.dart';
import 'package:enviro/screens/listIssuedBook.dart';
import 'package:flutter/material.dart';

import '../textDecoration.dart';

class ReturnBook extends StatelessWidget {
  final int iid;

  ReturnBook({Key key, this.iid}) : super(key: key);

  // ReturnBook({this.iid, this.uid, this.bid});
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
                print('Back to Issued list');
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Return Book',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Book id: ${iid.toString()}'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 200,
                    height: 70,
                    child: Center(
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(
                            Icons.assignment_return,
                            color: Colors.indigo,
                            size: 35.0,
                          ),
                          title: Text(
                            "Return Book",
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                fontSize: 18),
                          ),
                          onTap: () {
                            // Make screen for book view and search available with getting back feature(done)
                            print('Tapped');
                            LibraryProvider.db.deleteIssue(iid);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AdminPage();
                            }));
                          },

                          // minVerticalPadding: 4.0,
                        ),
                        // margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
                        color: Color.fromRGBO(252, 186, 3, 1),
                        shadowColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
