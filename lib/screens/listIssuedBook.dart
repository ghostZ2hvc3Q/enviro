import 'package:enviro/db/library_provider.dart';
import 'package:enviro/screens/returnBook.dart';
import 'package:flutter/material.dart';

import '../textDecoration.dart';

class ListIssuedBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enviro Issued Books',
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
              'List of Issued Books',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: IssuedBookServices(),
        ),
      ),
    );
  }
}

class IssuedBookServices extends StatefulWidget {
  @override
  _IssuedBookServicesState createState() => _IssuedBookServicesState();
}

class _IssuedBookServicesState extends State<IssuedBookServices> {
  List issueDetails;
  Future gettingIssue() async {
    // loading issue details
    issueDetails = await LibraryProvider.db.getIssue();
    return issueDetails;
  }

  // ignore: non_constant_identifier_names
  Widget IssueDetailList() {
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
              String iId = snapshot.data[pos]['iid'].toString();
              String iUid = snapshot.data[pos]['uid'].toString();
              String iBid = snapshot.data[pos]['bid'].toString();
              String iIssueDate =
                  snapshot.data[pos]['issueDate'].toString().split(" ")[0];
              String iFine = snapshot.data[pos]['fine'].toString();
              // String iPeriod = snapshot.data[pos]['period'].toString();
              String iReturnDate =
                  snapshot.data[pos]['returnDate'].toString().split(" ")[0];
              // final book = snapshot.data[pos];
              // print(snapshot.data.length);
              // String admin;
              // if (snapshot.data[pos]['isAdmin'] == 1) {
              //   admin = 'Admin';
              // } else {
              //   admin = 'Reader';
              // }
              return Card(
                color: itemListColor,
                child: ListTile(
                  leading: Text('IID: $iId UID: $iUid BID: $iBid'),
                  title: Text('Issue Date: $iIssueDate'),
                  subtitle: Text('Fine: $iFine'),
                  trailing: Text('Return Date: $iReturnDate'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ReturnBook(
                        iid: int.parse(iId),
                      );
                    }));
                  },
                ),
              );
            });
      },
      future: gettingIssue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: IssueDetailList(),
      ),
    );
  }
}
