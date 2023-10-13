part of 'storage.dart';

abstract class StorageChema {
  static int version = 1;

  static void onCreate(Database db, int version) async {
    var batch = db.batch();
    _createParams(batch);
    _createTable(batch);

    WriteLogs.write('create DB.... done');

    await batch.commit();
  }

  static void onUpgrade(Database db, int oldVersion, int newVersion) async {
    var batch = db.batch();
    // if (oldVersion == 1) {
    // batch.execute('DROP TABLE IF EXISTS ');
    // _createTable(batch);
    // }

    WriteLogs.write('onUpgrade DB.... done');

    await batch.commit();
  }

  static void _createParams(Batch batch) {
    batch.execute('CREATE TABLE Params ('
        'key TEXT,'
        'value TEXT'
        ')');
    batch.execute('CREATE TABLE OffLineData ('
        'key TEXT,'
        'value TEXT'
        ')');
  }

  static void _createTable(Batch batch) {
    // batch.execute('CREATE TABLE *** ('
    //     ')');
  }
}
