import 'package:bulk_sql/text_handler.dart';

void main() async {
  await TextHandler.split(
    filePath: '/Users/mac/Developer/bulk_sql/bin/output/all.txt',
    isTest: false,
  );
}
