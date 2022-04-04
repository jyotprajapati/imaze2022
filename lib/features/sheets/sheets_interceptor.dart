import 'package:gsheets/gsheets.dart';
import 'package:imaze2k22/core/keys.dart';

class SheetsInterceptor {
  static const _credentials = sheetsCredentials;

  final gsheets = GSheets(_credentials);
  Spreadsheet? ss;
  Worksheet? sheets;
  // Future<void> init() async {
  //   ss = await gsheets.spreadsheet(spreadSheetsId);
  //   sheets = ss!.worksheetByTitle("registration");
  //   sheets ??= await ss!.addWorksheet("registration");
  //   print('sheets initialized got ${sheets!.spreadsheetId} ');
  // }
  Future<void> init() async {
    ss = await gsheets.spreadsheet(spreadSheetsId);

    // print('sheets initialized got ${sheets!.spreadsheetId} ');
  }

  Future<void> initWorksheet(String worksheet) async {
    if (ss == null) {
      await init();
    }
    sheets = ss!.worksheetByTitle(worksheet);
    sheets ??= await ss!.addWorksheet(worksheet);
    // print('sheets initialized got ${sheets!.spreadsheetId} ');
  }

  Future addValue({
    String? enrollment,
    String? name,
    String? email,
    String? time,
    String? College,
    String? Department,
    String? Year,
    String? Phone,
    String? events,
    String? leaders,
    String? leaderEmails,
  }) async {
    try {
      final row = {
        'Enrollment': enrollment,
        'Name': name,
        'email': email,
        'Time': time,
        'College': College,
        'Department': Department,
        'Year': Year,
        'Phone': Phone,
        'events': events,
        'leaders': leaders,
        'leaderEmails': leaderEmails,
      };

      final rowIndex = await sheets!.values.rowIndexOf(enrollment!);
      if (!(rowIndex == -1)) {
        print('already registered');
        await sheets!.deleteRow(rowIndex);
      }
      return await sheets!.values.appendRow(row.values.toList());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  addIndividual({
    String? enrollment,
    String? name,
    String? email,
    String? activity,
    String? time,
    String? College,
    String? Department,
    String? Year,
    String? Phone,
    String? leaderName,
    String? leaderEmail,
  }) async {
    try {
      final row = {
        'Enrollment': enrollment,
        'Name': name,
        'email': email,
        'activity': activity,
        'Time': time,
        'College': College,
        'Department': Department,
        'Year': Year,
        'Phone': Phone,
        'leaderName': leaderName,
        'leaderEmail': leaderEmail,
      };

      if (activity == null) {
        row.remove("activity");
      }
      print("ROW $row");
      final rowIndex = await sheets!.values.rowIndexOf(enrollment!);
      if (!(rowIndex == -1)) {
        print('already registered');
        sheets!.deleteRow(rowIndex).then((value) => print("deleted"));
      }

      print("adding row");
      return await sheets!.values
          .appendRow(row.values.toList())
          .then((value) => print("added"));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
