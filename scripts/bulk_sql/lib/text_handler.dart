import 'package:bulk_sql/utils.dart';

class TextHandler {
  static void addAll({required String folderPath, required bool isTest}) {
    readFolderAndSave(folderPath);
  }

  static Future<void> split(
      {required String filePath, required bool isTest}) async {
    final linesSource = <String>[];
    final linesTarget = <String>[];

    final lines = await readFile(filePath);
    final splittedList = lines.split('\n');
    for (var i = 0; i < splittedList.length; i++) {
      final line = splittedList[i].trim().split('+');
      linesSource.add(line.first.trim());
      linesTarget.add(line.last.trim());
    }
    await saveFileTitle('source', linesSource.join('\n'));
    await saveFileTitle('target', linesTarget.join('\n'));
  }

  static Future<void> join(
      {required String file1Path,
      required String file2Path,
      required bool isTest}) async {
    final linesRaw = <String>[];
    final lines = await readFile(file1Path);
    final list1 = lines.split('\n');
    final lines2 = await readFile(file2Path);
    final list2 = lines2.split('\n');

    for (var i = 0; i < list1.length; i++) {
      final raw = list1[i].trim() + ' ; ' + list2[i].trim();
      linesRaw.add(raw);
    }

    await saveFileTitle('raw', linesRaw.join('\n'));
  }
}
