import 'package:bulk_sql/bulk_sql.dart';

// TODO - be able to wrap them
// DELETE FROM DevProj
// WHERE (user_id, zone_id) IN ((1,'ASN'), (1,'ASN'))

const LINES_PER_FILE = 10;
const TABLE = 'TIERS';
const IDNAME = 'T_AUXILIAIRE';
final tables = [
  'GL_NATUREPIECEG',
  'GL_SOUCHE',
  'GL_NUMERO',
  'GL_INDICEG',
  'GL_NUMLIGNE'
];

void main() async {
  await Bulk.extractCompositeIds(
    filePath: 'lignes.txt',
    linePerFile: 10,
    tableNames: tables,
    idName: IDNAME,
    isTest: false,
  );
/*   await Bulk.simpleExtract(
    linePerFile: LINES_PER_FILE,
    tableName: TABLE,
    idName: IDNAME,
    filePath: 'rgpd_purge_clients_cegid_20221012.txt',
    isTest: false,
  );
 */
}
