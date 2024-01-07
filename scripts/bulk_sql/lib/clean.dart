import 'package:bulk_sql/utils.dart';

class VocabClean {
  static Future<void> simpleClean(
      {required String filePath, required bool isTest}) async {
    final linesNoSpace = <String>[];

    final lines = await readFile(filePath);
    final splittedList = lines.split('\n');
    print(splittedList.first);
    for (var i = 0; i < splittedList.length; i++) {
      final line = splittedList[i].trim().split(';');
      if (line.first.contains(' ')) {
        // do not add line
      } else {
        linesNoSpace.add(splittedList[i].trim());
      }
    }
    print(linesNoSpace.length);
    final linesNoSpaceString = linesNoSpace.join("\n");
    await saveFile(0, linesNoSpaceString, isTest);
  }
}
