import 'package:bulk_sql/utils.dart';

class Bulk {
  static Future<void> extractCompositeIds(
      {required String filePath,
      required int linePerFile,
      required List<String> tableNames,
      required String idName,
      required bool isTest}) async {
    var compositeKeys = await readFile(filePath);
    compositeKeys = '(' + compositeKeys;
    final tabCharacter = String.fromCharCode(9);
    final cleanKeys = compositeKeys.replaceAll(RegExp(tabCharacter), ',');
    print("cleanKeys $cleanKeys");
    final cleanKeys2 = cleanKeys.replaceAll(RegExp('\r\n'), ')\n(');
    print("cleanKeys2 $cleanKeys2");
    final splittedList = cleanKeys2.split('\n');
    print("splittedList $splittedList");
    final filesToCreate = (compositeKeys.length / linePerFile).round();

    var remainingLines = splittedList.length;
    //print(splittedList);

    for (var i = 0; i < filesToCreate; i++) {
      final start = splittedList.length - remainingLines;
      var end = start + linePerFile;
      //print('start ${ids.length - remainingLines}');
      //print('end ${ids.length - remainingLines + LINES}');
      if (end > splittedList.length) {
        end = splittedList.length;
      }
      if (start >= splittedList.length) {
        break;
      }
      final temp = splittedList.getRange(start, end);
      remainingLines = remainingLines - linePerFile;
      if (temp.isNotEmpty && temp.length > 1) {
        var ee = temp.join("");
        ee = ee.substring(0, ee.length - 1); // remove last comma
        ee = "DELETE FROM ${tableNames.join(',')} WHERE $idName IN (" +
            ee +
            ");";

        try {
          await saveFile(i, ee, isTest);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  static Future<void> extractQuoteAndCommaAlreadyThere(
      {required String filePath,
      required int linePerFile,
      required String tableName,
      required String idName,
      required bool isTest}) async {
    final ids = await readFile(filePath);
    final splittedList = ids.replaceAll(r'|', '').split('\r\n');
    final filesToCreate = (ids.length / linePerFile).round();
    var remainingLines = splittedList.length;
    //print(splittedList);

    for (var i = 0; i < filesToCreate; i++) {
      final start = splittedList.length - remainingLines;
      var end = start + linePerFile;
      //print('start ${ids.length - remainingLines}');
      //print('end ${ids.length - remainingLines + LINES}');
      if (end > splittedList.length) {
        end = splittedList.length;
      }
      if (start >= splittedList.length) {
        break;
      }
      final temp = splittedList.getRange(start, end);
      remainingLines = remainingLines - linePerFile;
      if (temp.isNotEmpty && temp.length > 1) {
        var ee = temp.join("");
        ee = ee.substring(0, ee.length - 1);
        ee = "DELETE FROM $tableName WHERE $idName IN (" + ee + ");";

        try {
          await saveFile(i, ee, isTest);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  static Future<void> simpleExtract(
      {required String filePath,
      required int linePerFile,
      required String tableName,
      required String idName,
      required bool isTest}) async {
    final ids = await readFile(filePath);
    final splittedList = ids.replaceAll(r'|', '').split('\r\n');
    final filesToCreate = (ids.length / linePerFile).round();
    var remainingLines = splittedList.length;
    //print(splittedList);

    for (var i = 0; i < filesToCreate; i++) {
      final start = splittedList.length - remainingLines;
      var end = start + linePerFile;
      //print('start ${ids.length - remainingLines}');
      //print('end ${ids.length - remainingLines + LINES}');
      if (end > splittedList.length) {
        end = splittedList.length;
      }
      if (start >= splittedList.length) {
        break;
      }
      final temp = splittedList.getRange(start, end);
      remainingLines = remainingLines - linePerFile;
      if (temp.isNotEmpty && temp.length > 1) {
        var ee = temp.join("','");
        ee = ee.substring(0, ee.length - 1);
        ee = "DELETE FROM $tableName WHERE $idName IN ('" + ee + "');";

        try {
          await saveFile(i, ee, isTest);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
