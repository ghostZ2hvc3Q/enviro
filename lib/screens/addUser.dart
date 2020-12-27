import 'package:enviro/db/library_provider.dart';
import 'package:enviro/screens/models/user.dart';
import 'package:enviro/screens/adminPage.dart';
import 'package:enviro/screens/viewBooks.dart';
import 'package:enviro/screens/viewUsers.dart';
import 'package:flutter/material.dart';
import '../textDecoration.dart';

class AddUser extends StatelessWidget {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminPage();
                  }));
                }),
            title: Text(
              'Add User',
              style: appBarTitle,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: AddUserService(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddUserService extends StatefulWidget {
  bool isSwitched = false;
  @override
  _AddUserServiceState createState() => _AddUserServiceState();
}

class _AddUserServiceState extends State<AddUserService> {
  final _userForm = GlobalKey<FormState>();
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  var userIsAdmin = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    userEmail.dispose();
    userPassword.dispose();
    userIsAdmin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // Form for taking user information
      key: _userForm,
      child: Center(
        child: SizedBox(
          height: 400,
          width: 300,
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
                      if (value.isEmpty) {
                        return 'please enter name!';
                      }
                      return null;
                    },
                    // getting title of book
                    controller: userName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.drive_file_rename_outline),
                      labelText: 'User Name',
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
                      if (value.isEmpty) {
                        return 'please enter Email Address!';
                      }
                      return null;
                    },
                    // getting title of book
                    controller: userEmail,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      labelText: 'Email Id',
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
                      if (value.isEmpty) {
                        return 'please enter valid password!';
                      }
                      return null;
                    },
                    // getting title of book
                    controller: userPassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security_outlined),
                      labelText: 'Enter Password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: Card(
                  color: cardColor,
                  child: SwitchListTile(
                    value: widget.isSwitched,
                    title: Text(
                      'Admin',
                      style: TextStyle(
                          color: textColor,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        widget.isSwitched = value;
                        print(widget.isSwitched);
                        userIsAdmin.text =
                            (widget.isSwitched == true ? 'true' : 'false');
                        print(userIsAdmin);
                      });
                    },
                    secondary: Icon(
                      Icons.add_moderator,
                      color: Colors.indigo,
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
                            Icons.verified_user,
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
                            print('Pressed Add User');
                            // perform action to add book info to database
                            if (!_userForm.currentState.validate()) {
                              print('Not valid!');
                              return;
                            }
                            _userForm.currentState.save();

                            print(userName.text);
                            // Book book = Book(
                            //     title: bookTitle.text,
                            //     author: bookAuthor.text,
                            //     genre: bookGenre.text);

                            User user = User(
                              name: userName.text,
                              email: userEmail.text,
                              password: userPassword.text,
                              // ignore: unrelated_type_equality_checks
                              isAdmin: userIsAdmin.text == 'true',
                            );
                            LibraryProvider.db.insertUser(user);
                            print('user added.');

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
                            Icons.people,
                            color: Colors.indigo,
                            size: 30,
                          ),
                          title: Text(
                            'Users',
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
                            print('Pressed View Users');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ViewUsers();
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
