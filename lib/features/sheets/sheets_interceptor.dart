import 'package:gsheets/gsheets.dart';
import 'package:imaze2k22/core/keys.dart';

class SheetsInterceptor {
  static const _credentials = sheetsCredentials;

  final gsheets = GSheets(_credentials);
  Spreadsheet? ss;
  Worksheet? sheets;
  Future<void> init() async {
    ss = await gsheets.spreadsheet(spreadSheetsId);
    sheets = ss!.worksheetByTitle("registration");
    sheets ??= await ss!.addWorksheet("registration");
    print('sheets initialized got ${sheets!.spreadsheetId} ');
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
  }) async {
    try {
      final row = {
        'Enrollment': enrollment,
        'Name': name,
        'email': email,
        'Time': time,
        'College': College,
        'Department': Department,
        ' Year': Year,
        'Phone': Phone,
      };
      await sheets!.values.appendRow(row.values.toList());
      print((await sheets!.values.map.allRows())!
          .where((element) => element.containsValue(enrollment))
          .toList());
      if ((await sheets!.values.map.allRows())!
          .where((element) => element.containsValue(enrollment))
          .toList()
          .isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
