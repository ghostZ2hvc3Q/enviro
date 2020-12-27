import 'package:enviro/textDecoration.dart';
import 'package:flutter/material.dart';
import 'package:enviro/screens/viewBooks.dart';
import 'package:enviro/screens/userBooks.dart';

class UserPage extends StatelessWidget {
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
          backgroundColor: Colors.transparent,
          body: UserServices(),
        ),
      ),
    );
  }
}

class UserServices extends StatefulWidget {
  @override
  _UserServicesState createState() => _UserServicesState();
}

class _UserServicesState extends State<UserServices> {
  Widget userActionButtonCard(IconData icons, String actionName, Widget route) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 200,
        height: 70,
        child: Center(
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(
                icons,
                color: Colors.indigo,
                size: 35.0,
              ),
              title: Text(
                "$actionName",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(60, 11, 82, 1),
                    fontSize: 18),
              ),
              onTap: () {
                // Make screen for book view and search available with getting back feature(done)
                print('Tapped');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return route;
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image(
            image: AssetImage('images/EnviroLogo2.png'),
            width: 150,
            height: 150,
          ),
          // Divider(
          //   color: textColor,
          // ),
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
                'hafeezarfi',
                style: TextStyle(
                    color: textColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              Text('...')
            ],
          ),
          Divider(
            color: textColor,
            indent: 40.0,
            endIndent: 40.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userActionButtonCard(Icons.book, 'View Books',
                  ViewBooks()), // removed repetition for action cards. Books page
              userActionButtonCard(Icons.bookmark, 'My Books',
                  UserBooks()), // Books user currently have

              // Card(
              //
              //   elevation: 5,
              //   child: ListTile(
              //     leading: Icon(Icons.book,color: Colors.indigo,size: 35.0,),
              //     title: Text('View Books',style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.bold,color: Color.fromRGBO(60, 11, 82,1),fontSize: 18),),
              //     onTap: (){//  Make screen for book view and search available with getting back feature (done)
              //       print('Tapped');
              //       Navigator.push(context, MaterialPageRoute(builder: (context){
              //         return ViewBooks();
              //       }));
              //     },
              //
              //     // minVerticalPadding: 4.0,
              //   ),
              //   margin:EdgeInsets.symmetric(vertical: 20.0,horizontal: 80.0),
              //   color: Color.fromRGBO(252, 186, 3, 1),
              //   shadowColor: Colors.red,
              // )
            ],
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
    );
  }
}
