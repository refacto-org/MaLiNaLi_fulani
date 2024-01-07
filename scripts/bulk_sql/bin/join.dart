import 'package:bulk_sql/text_handler.dart';

void main() async {
  await TextHandler.join(
    file1Path: 'dico_src.txt',
    file2Path: 'dico_tgt.txt',
    isTest: false,
  );
}
