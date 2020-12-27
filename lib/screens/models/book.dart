import '../../db/library_provider.dart';

class Book {
  int bid;
  String title;
  String author;
  String genre;

  Book({this.bid, this.title, this.author, this.genre});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      LibraryProvider.COLUMN_BID: bid,
      LibraryProvider.COLUMN_TITLE: title,
      LibraryProvider.COLUMN_AUTHOR: author,
      LibraryProvider.COLUMN_GENRE: genre
    };

    if (bid != null) {
      map[LibraryProvider.COLUMN_BID] = bid;
    }
    return map;
  }

  Book.fromMap(Map<String, dynamic> map) {
    // uid = map[LibraryProvider.COLUMN_UID];
    // name = map[LibraryProvider.COLUMN_NAME];
    // email = map[LibraryProvider.COLUMN_EMAIL];
    // password = map[LibraryProvider.COLUMN_PASSWORD];
    // isAdmin = map[LibraryProvider.COLUMN_ADMIN] == 1;
    map[LibraryProvider.COLUMN_BID] = bid;
    map[LibraryProvider.COLUMN_TITLE] = title;
    map[LibraryProvider.COLUMN_AUTHOR] = author;
    map[LibraryProvider.COLUMN_GENRE] = genre;
  }
}
