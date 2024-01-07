import 'dart:io';

import 'package:bulk_sql/bulk_sql.dart';

void main() async {
  stdout.writeln('Hola! Let\'s put those ids into multiple files for deletion');
  stdout.writeln('''The input .txt file should looks like : 
  12345678
  98764321
  00000000
  ''');
  stdout.writeln('''And the output will look like : 
  DELETE FROM TIERS WHERE T_AUXILIAIRE IN ('12345678', '98764321', '00000000');
  ''');
  stdout.writeln('Type the file path :');
  final filePath = stdin.readLineSync();
  if (filePath != null && filePath.isNotEmpty) {
    stdout.writeln('You typed: $filePath\nok ? y/N');
    final input2 = stdin.readLineSync();
    if (input2 == 'y') {
      stdout.writeln('Lines per file (100 000) ? ');
      final linesPerFile = stdin.readLineSync();
      stdout.writeln('TABLE name (TIERS)');
      final tableName = stdin.readLineSync();
      stdout.writeln('ID field name (T_AUXILIAIRE)');
      final idName = stdin.readLineSync();
      await Bulk.simpleExtract(
        linePerFile: int.tryParse(linesPerFile ?? '100000') ?? 100000,
        tableName: tableName ?? 'TIERS',
        idName: idName ?? 'T_AUXILIAIRE',
        filePath: filePath,
        isTest: false,
      );
      stdout.writeln('Good files are in the done folder');
    }
  }
}
