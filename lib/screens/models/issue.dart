import 'package:enviro/db/library_provider.dart';

class Issue {
  // static const String COLUMN_IID = "iid";
  // static const String COLUMN_IBID = "bid";
  // static const String COLUMN_IUID = "uid";
  // static const String COLUMN_ISSUE_DATE = "issueDate";
  // static const String COLUMN_RETURN_DATE = "returnDate";
  // static const String COLUMN_FINE = "fine";
  // static const String COLUMN_PERIOD = "period";
  int iid;
  int ibid;
  int iuid;
  String issueDate;
  String returnDate;
  int fine;
  // int period;

  Issue({
    this.iid,
    this.ibid,
    this.iuid,
    this.issueDate,
    this.returnDate,
    this.fine,
    // this.period
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      LibraryProvider.COLUMN_IID: iid,
      LibraryProvider.COLUMN_IBID: ibid,
      LibraryProvider.COLUMN_IUID: iuid,
      LibraryProvider.COLUMN_ISSUE_DATE: issueDate,
      LibraryProvider.COLUMN_RETURN_DATE: returnDate,
      LibraryProvider.COLUMN_FINE: fine,
      // LibraryProvider.COLUMN_PERIOD: period
    };

    if (iid != null) {
      map[LibraryProvider.COLUMN_BID] = iid;
    }
    return map;
  }

  Issue.fromMap(Map<String, dynamic> map) {
    // uid = map[LibraryProvider.COLUMN_UID];
    // name = map[LibraryProvider.COLUMN_NAME];
    // email = map[LibraryProvider.COLUMN_EMAIL];
    // password = map[LibraryProvider.COLUMN_PASSWORD];
    // isAdmin = map[LibraryProvider.COLUMN_ADMIN] == 1;
    map[LibraryProvider.COLUMN_IID] = iid;
    map[LibraryProvider.COLUMN_IBID] = ibid;
    map[LibraryProvider.COLUMN_IUID] = iuid;
    map[LibraryProvider.COLUMN_ISSUE_DATE] = issueDate;
    map[LibraryProvider.COLUMN_RETURN_DATE] = returnDate;
    map[LibraryProvider.COLUMN_FINE] = fine;
    // map[LibraryProvider.COLUMN_PERIOD] = period;
  }
}
