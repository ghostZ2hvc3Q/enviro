import 'package:enviro/db/library_provider.dart';

class User {
  int uid;
  String name;
  String email;
  String password;
  bool isAdmin;
  User({this.uid, this.name, this.email, this.password, this.isAdmin});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      LibraryProvider.COLUMN_NAME: name,
      LibraryProvider.COLUMN_EMAIL: email,
      LibraryProvider.COLUMN_PASSWORD: password,
      LibraryProvider.COLUMN_ADMIN: isAdmin ? 1 : 0
    };

    if (uid != null) {
      map[LibraryProvider.COLUMN_UID] = uid;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    uid = map[LibraryProvider.COLUMN_UID];
    name = map[LibraryProvider.COLUMN_NAME];
    email = map[LibraryProvider.COLUMN_EMAIL];
    password = map[LibraryProvider.COLUMN_PASSWORD];
    isAdmin = map[LibraryProvider.COLUMN_ADMIN] == 1;
  }
}
