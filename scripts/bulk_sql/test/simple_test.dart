import 'package:bulk_sql/bulk_sql.dart';
import 'package:bulk_sql/utils.dart';
import 'package:test/test.dart';

void main() {
  test('simple extract', () async {
    await createTestFolder(); // does nothing if already there
    await cleanTestFolder(); // remove old tests
    await createTestFolder();

    await Bulk.simpleExtract(
        linePerFile: 2,
        tableName: 'ARTICLE',
        idName: 'GA_ARTICLE',
        filePath: 'temp.txt',
        isTest: true);

    final string0 =
        "DELETE FROM ARTICLE WHERE GA_ARTICLE IN ('H000002R             01A         X','H0000031          00102B         X');";
    final string1 =
        "DELETE FROM ARTICLE WHERE GA_ARTICLE IN ('H0000041          00100P         X','H000007FL            07N         X');";
    final string2 =
        "DELETE FROM ARTICLE WHERE GA_ARTICLE IN ('H000007FL            0AA         X','H000007FL            0EY         X');";

    final temp0 = await readFile('done_test/temp_0.txt');
    final temp1 = await readFile('done_test/temp_1.txt');
    final temp2 = await readFile('done_test/temp_2.txt');

    expect(temp0, string0);
    expect(temp1, string1);
    expect(temp2, string2);
  });
}
