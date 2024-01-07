import 'dart:io';

void readFolderAndSave(String dirPath) {
  final StringBuffer sb = StringBuffer();
  final dir = Directory(dirPath);
  final isThere = dir.existsSync();
  if (isThere) {
    final files = dir.listSync();
    for (final file in files) {
      if (file.path.contains('.DS_Store') == false) {
        final content = File(file.path).readAsStringSync();
        sb.writeln(content);
      }
    }
    saveFileTitleSync('all', sb.toString());
  }
}

Future<String> readFile(String filePath) async =>
    await File(filePath).readAsStringSync();

Future<File> saveFile(int counter, String string, bool isTest) async {
  await Directory('done').create();
  final file = await File(
          isTest ? 'done_test/temp_$counter.txt' : 'done/temp_$counter.txt')
      .create();
  return await file.writeAsString(string);
}

void saveFileTitleSync(String title, String string) async {
  Directory('output').createSync();
  File('output/$title.txt').createSync();
  return File('output/$title.txt').writeAsStringSync(string);
}

Future<File> saveFileTitle(String title, String string) async {
  await Directory('output').create();
  final file = await File('output/$title.txt').create();
  return await file.writeAsString(string);
}

Future createTestFolder() async => await Directory('done_test').create();
Future cleanTestFolder() async =>
    await Directory('done_test').delete(recursive: true);
