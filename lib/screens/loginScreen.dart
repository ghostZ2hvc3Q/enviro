// IGNORE unused imports
import 'package:enviro/db/library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:enviro/main.dart';
import 'package:enviro/screens/userPage.dart';
import 'package:enviro/screens/adminPage.dart';
import 'package:hive/hive.dart';

const users = const {
  'admin@admin.com': 'admin123',
  'hafeezarfi@gmail.com': '12345',
  'hwareco@gmail.com': 'hunter@killer'
};

// Future gettingUsers() async {
//   storing users to authenticate
// userList = await LibraryProvider.db.getUsers();
// return userList;
// }
//
// List userList;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enviro Login Screen',
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/EnviroBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: Colors.teal,
          // ),
          backgroundColor: Colors.teal,
          body: LoginBar(),
        ),
      ),
    );
  }
}

class LoginBar extends StatefulWidget {
  @override
  _LoginBarState createState() => _LoginBarState();
}

class _LoginBarState extends State<LoginBar> {
  Duration get loginTime => Duration(milliseconds: 2250 * 2);
  Future<String> _authUser(LoginData data) async {
    // userList = await LibraryProvider

    // LibraryProvider.db.verifyUser(data.name, data.password);

    print('Name: ${data.name}, Password: ${data.password}');

    // TODO time delay adjustment for first time initialising db
    // return Future.delayed(loginTime).then((_) {
    //   gettingUsers();
    //   print(userList);
    // print(userList);
    // for (var user in userList) {
    //   print(user['email']);
    //   if (user['email'] == data.name) {
    //     if (user['password'] == data.password) {
    //       print('Login success!');
    //       if (user['isAdmin'] == 1) {
    //         return Navigator.push(context,
    //             MaterialPageRoute(builder: (context) {
    //           return AdminPage(); //Routing user page
    //         }));
    //       } else {
    //         return Navigator.push(context,
    //             MaterialPageRoute(builder: (context) {
    //           return UserPage();
    //         }));
    //       }
    //     }
    //   }
    // }
    //
    // return 'Email or password is wrong!';
    if (!users.containsKey(data.name)) {
      return 'Username not exists';
    }
    if (users[data.name] != data.password) {
      return 'Password does not match';
    }
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AdminPage(); //Routing user page
    }));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterLogin(
          messages: LoginMessages(
              signupButton: 'Register',
              recoverPasswordButton: 'can\'t remember password!',
              forgotPasswordButton: 'shouldn\'t have forgot password!'),
          title: 'Enviro',
          logo: 'images/EnviroLogo2.png',
          theme: LoginTheme(
            pageColorDark: Colors.black,
            pageColorLight: Colors.teal,
            errorColor: Color.fromRGBO(60, 11, 82, 1),
            titleStyle: TextStyle(
                fontFamily: 'Quicksand',
                color: Color.fromRGBO(60, 11, 82, 1),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            primaryColor: Color.fromRGBO(60, 11, 82, 1),
            cardTheme: CardTheme(
              elevation: 5,
              color: Color.fromRGBO(94, 83, 71, 1),
              shadowColor: Color.fromRGBO(60, 11, 82, 1),
            ),
            buttonTheme: LoginButtonTheme(splashColor: Colors.teal),
          ),
          onSignup: null,
          onLogin: _authUser,
          onRecoverPassword: null),
    );
  }
}
