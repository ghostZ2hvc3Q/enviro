import 'package:enviro/screens/models/book.dart';
import 'package:enviro/screens/models/issue.dart';
import 'package:enviro/screens/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LibraryProvider {
  // Listener: Table USERS
  static const String TABLE_USERS = "users";
  static const String COLUMN_UID = "uid";
  static const String COLUMN_NAME = "name";
  static const String COLUMN_EMAIL = "email";
  static const String COLUMN_PASSWORD = "password";
  static const String COLUMN_ADMIN = "isAdmin";

  // Listener: Table BOOKS
  static const String TABLE_BOOKS = "books";
  static const String COLUMN_BID = "bid";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_AUTHOR = "author";
  static const String COLUMN_GENRE = "genre";

  // Listener: Table ISSUED
  static const String TABLE_ISSUED = "issued";
  static const String COLUMN_IID = "iid";
  static const String COLUMN_IBID = "bid";
  static const String COLUMN_IUID = "uid";
  static const String COLUMN_ISSUE_DATE = "issueDate";
  static const String COLUMN_RETURN_DATE = "returnDate";
  static const String COLUMN_FINE = "fine";
  // static const String COLUMN_PERIOD = "period";

  LibraryProvider._();

  static final LibraryProvider db = LibraryProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future checkExists() async {
    if (_database != null) {
      print('Initialised!');
    } else {
      print('Not Initialised, initializing...');
      _database = await initDB();
    }
  }

  Future<Database> initDB() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'libraryDB.db'), version: 1,
        onCreate: (Database database, int version) async {
      print("Creating users table");
      await database.execute("CREATE TABLE $TABLE_USERS ("
          "$COLUMN_UID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT,"
          "$COLUMN_EMAIL TEXT,"
          "$COLUMN_PASSWORD TEXT,"
          "$COLUMN_ADMIN INTEGER"
          ")");
      await database.execute("CREATE TABLE $TABLE_BOOKS ("
          "$COLUMN_BID INTEGER PRIMARY KEY,"
          "$COLUMN_TITLE TEXT,"
          "$COLUMN_AUTHOR TEXT,"
          "$COLUMN_GENRE TEXT"
          ")");
      await database.execute("CREATE TABLE $TABLE_ISSUED ("
          "$COLUMN_IID INTEGER PRIMARY KEY,"
          "$COLUMN_IBID INTEGER,"
          "$COLUMN_IUID INTEGER,"
          "$COLUMN_ISSUE_DATE TEXT,"
          "$COLUMN_RETURN_DATE TEXT,"
          "$COLUMN_FINE INTEGER"
          // "$COLUMN_PERIOD INTEGER"
          ")");
      await database.execute("INSERT INTO $TABLE_USERS ("
          "$COLUMN_NAME,"
          "$COLUMN_EMAIL,"
          "$COLUMN_PASSWORD,"
          "$COLUMN_ADMIN"
          ")"
          " VALUES("
          "'Admin',"
          "'admin@admin.com',"
          "'admin123',"
          "1"
          ")");
      await database.execute("INSERT INTO $TABLE_USERS ("
          "$COLUMN_NAME,"
          "$COLUMN_EMAIL,"
          "$COLUMN_PASSWORD,"
          "$COLUMN_ADMIN"
          ")"
          " VALUES("
          "'Hafeez',"
          "'hafeez@email.com',"
          "'hafeez123',"
          "0"
          ")");
      await database.execute("INSERT INTO $TABLE_USERS ("
          "$COLUMN_NAME,"
          "$COLUMN_EMAIL,"
          "$COLUMN_PASSWORD,"
          "$COLUMN_ADMIN"
          ")"
          " VALUES("
          "'Rupesh',"
          "'rupesh@email.com',"
          "'rupesh123',"
          "0"
          ")");
      await database.execute("INSERT INTO $TABLE_USERS ("
          "$COLUMN_NAME,"
          "$COLUMN_EMAIL,"
          "$COLUMN_PASSWORD,"
          "$COLUMN_ADMIN"
          ")"
          " VALUES("
          "'Ravi',"
          "'ravi@email.com',"
          "'ravi123',"
          "0"
          ")");
      await database.execute("INSERT INTO $TABLE_BOOKS ("
          "$COLUMN_TITLE,"
          "$COLUMN_AUTHOR,"
          "$COLUMN_GENRE"
          ")"
          "VALUES("
          "'Introduction To Algorithms',"
          "'Thomas H. Cormen',"
          "'Textbook'"
          ")");
      await database.execute("INSERT INTO $TABLE_BOOKS ("
          "$COLUMN_TITLE,"
          "$COLUMN_AUTHOR,"
          "$COLUMN_GENRE"
          ")"
          "VALUES("
          "'Code Complete',"
          "'Steve McConnell',"
          "'Textbook'"
          ")");
      await database.execute("INSERT INTO $TABLE_BOOKS ("
          "$COLUMN_TITLE,"
          "$COLUMN_AUTHOR,"
          "$COLUMN_GENRE"
          ")"
          "VALUES("
          "'The C Programming Language',"
          "'Dennis M Ritchie',"
          "'Textbook'"
          ")");
      await database.execute("INSERT INTO $TABLE_BOOKS ("
          "$COLUMN_TITLE,"
          "$COLUMN_AUTHOR,"
          "$COLUMN_GENRE"
          ")"
          "VALUES("
          "'DATA COMMUNICATIONS AND NETWORKING',"
          "'Behrouz A. Forouzan',"
          "'Textbook'"
          ")");
      await database.execute("INSERT INTO $TABLE_ISSUED ("
          "$COLUMN_IBID,"
          "$COLUMN_IUID,"
          "$COLUMN_ISSUE_DATE,"
          "$COLUMN_RETURN_DATE,"
          "$COLUMN_FINE"
          ")"
          "VALUES("
          "2,"
          "3,"
          "'2020-12-20 12:18:20.532',"
          "'',"
          "0"
          ")");
      await database.execute("INSERT INTO $TABLE_ISSUED ("
          "$COLUMN_IBID,"
          "$COLUMN_IUID,"
          "$COLUMN_ISSUE_DATE,"
          "$COLUMN_RETURN_DATE,"
          "$COLUMN_FINE"
          ")"
          "VALUES("
          "3,"
          "3,"
          "'2020-12-20 12:18:20.532',"
          "'',"
          "0"
          ")");
      await database.execute("INSERT INTO $TABLE_ISSUED ("
          "$COLUMN_IBID,"
          "$COLUMN_IUID,"
          "$COLUMN_ISSUE_DATE,"
          "$COLUMN_RETURN_DATE,"
          "$COLUMN_FINE"
          ")"
          "VALUES("
          "4,"
          "2,"
          "'2020-12-18 12:18:20.532',"
          "'',"
          "0"
          ")");
    });
  }

  Future<List> getUsers() async {
    final db = await database;
    var users = await db.query(TABLE_USERS, columns: [
      COLUMN_UID,
      COLUMN_NAME,
      COLUMN_EMAIL,
      COLUMN_PASSWORD,
      COLUMN_ADMIN
    ]);
    // List<User> userList; // = List<User>();
    // users.forEach((currentUser) {
    //   User user = User.fromMap(currentUser);
    //   userList.add(user);
    // });
    // print(userList);
    return users;
  }

  Future<User> insertUser(User user) async {
    final db = await database;

    user.uid = await db.insert(TABLE_USERS, user.toMap());
    return user;
  }

  Future<List> getBooks() async {
    final db = await database;
    var books = await db.query(TABLE_BOOKS,
        columns: [COLUMN_BID, COLUMN_TITLE, COLUMN_AUTHOR, COLUMN_GENRE]);
    // ignore: deprecated_member_use
    // List<Book> bookList;// = List<Book>();
    // books.forEach((currentBook) {
    //   Book book = Book.fromMap(currentBook);
    //   bookList.add(book);
    // });
    // print(bookList);
    // return bookList;
    // print(books);
    return books;
  }

  Future<Book> insertBook(Book book) async {
    final db = await database;
    book.bid = await db.insert(TABLE_BOOKS, book.toMap());
    return book;
  }

  Future<List> getIssue() async {
    final db = await database;
    var issues = await db.query(TABLE_ISSUED, columns: [
      COLUMN_IID,
      COLUMN_IBID,
      COLUMN_IUID,
      COLUMN_ISSUE_DATE,
      COLUMN_RETURN_DATE,
      COLUMN_FINE,
      // COLUMN_PERIOD // no need of period removing
    ]);

    // ignore: deprecated_member_use
    // List<Issue> issueList; // = List<Issue>();
    // issues.forEach((currentIssue) {
    //   Issue issue = Issue.fromMap(currentIssue);
    //   issueList.add(issue);
    // });
    // print(issueList);
    return issues;
  }

  Future<Issue> insertIssue(Issue issued) async {
    final db = await database;
    issued.iid = await db.insert(TABLE_ISSUED, issued.toMap());
    return issued;
  }

  Future<bool> verifyUser(String email, String password) async {
    final db = await database;

    var user = db.query(TABLE_USERS,
        columns: [
          COLUMN_UID,
          COLUMN_NAME,
          COLUMN_EMAIL,
          COLUMN_PASSWORD,
          COLUMN_ADMIN
        ],
        where: "email=?",
        whereArgs: [email]);

    print(user);
  }

  Future<int> deleteIssue(int iid) async {
    final db = await database;
    return db.delete(
      TABLE_ISSUED,
      where: "iid= ?",
      whereArgs: [iid],
    );
  }

  Future<int> deleteUser(int uid) async {
    final db = await database;
    return db.delete(
      TABLE_USERS,
      where: "uid=?",
      whereArgs: [uid],
    );
  }

  Future<int> deleteBook(int bid) async {
    final db = await database;
    return db.delete(
      TABLE_BOOKS,
      where: "bid=?",
      whereArgs: [bid],
    );
  }
}
