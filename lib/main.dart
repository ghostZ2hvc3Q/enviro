// Things left to improve/achieve, if further continued.

// data administration networking
// TODO instead of local storage providing global storage for everyone(implement)
// TODO initialise fine alert system
// TODO implement user/reader's books section
// TODO implement more enhanced algorithms to add search and sort components
// TODO add components to update user info, provide password recovery via email/phone
// TODO create api to get data from web securely

import 'package:enviro/db/library_provider.dart';
import 'package:enviro/textDecoration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:enviro/screens/loginScreen.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:dcdg/dcdg.dart';

void main() {
  runApp(Enviro());
}

class Enviro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enviro',
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/EnviroBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: WelcomeScreen(),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // implement initState(done)
    super.initState();
    // LibraryProvider.db.checkExists();
    // print(LibraryProvider.db.hashCode);
    // TODO initialise database here or before getting to login authentication
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Enviro'),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/EnviroLogo2.png'),
              width: 150,
              height: 150,
            ),
            Divider(
              color: Colors.transparent,
            ),
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
            SizedBox(
              height: 100.0,
              child: Divider(
                color: Colors.transparent,
              ),
            ),
            // TODO make functions to make it responsive (can\'t be done: time factor)
            SizedBox(
              height: 60.0,
              width: 200.0,
              child: Card(
                color: cardColor,
                // margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 65.0),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_forward,
                    color: textColor,
                  ),
                  title: Text(
                    'Lets Start',
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                  onTap: () {
                    print('tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }),
                    );
                  },
                ),
                shadowColor: textColor,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
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
        color: Colors.transparent,
      ),
    );
  }
}
