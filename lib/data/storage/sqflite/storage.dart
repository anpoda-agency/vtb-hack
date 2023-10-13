import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../service/write_log.dart';
import '../pref_storage.dart';

part 'storage_chema.dart';

class SecureStorageSQflite {
  static Database? _db;

  Future<String?> init() async {
    if (_db != null) {
      return null;
    }

    try {
      var st = DateTime.now().millisecondsSinceEpoch;
      Directory dir =
          (Platform.isIOS) ? await getLibraryDirectory() : await getApplicationDocumentsDirectory();
      String path = '${dir.path}/quickmeet.db';
      _db = await openDatabase(
        path,
        version: StorageChema.version,
        onOpen: (db) {},
        onCreate: StorageChema.onCreate,
        onUpgrade: StorageChema.onUpgrade,
        onDowngrade: StorageChema.onUpgrade,
      );
      WriteLogs.write('DB connect... done');
      WriteLogs.write('DB version: ${await _db?.getVersion() ?? ''}');

      WriteLogs.storageSQflite('init [${DateTime.now().millisecondsSinceEpoch - st}ms]');
      return null;
    } catch (ex) {
      WriteLogs.write('!!!  DB init Error: $ex');
      return ex.toString();
    }
  }

  Future<bool> setInt(PrefName key, int val) async {
    return await setRecord(key, val.toString());
  }

  Future<int?> getInt(PrefName key) async {
    var res = await getRecord(key);
    return (res != null) ? int.tryParse(res) : null;
  }

  Future<bool> setBool(PrefName key, bool val) async {
    return await setRecord(key, val.toString());
  }

  Future<bool?> getBool(PrefName key) async {
    var res = await getRecord(key);

    bool? val;
    if (res == 'true') {
      val = true;
    } else if (res == 'false') {
      val = false;
    }

    return val;
  }

  Future<bool> setList(PrefName key, List<String> val) async {
    return await setRecord(key, jsonEncode(val));
  }

  Future<List<String>?> getList(PrefName key) async {
    var res = await getRecord(key);
    var list = (res != null) ? jsonDecode(res) : null;

    return (list is List<String>) ? list : null;
  }

  Future<bool> setRecord(PrefName key, String val) async {
    var st = DateTime.now().millisecondsSinceEpoch;
    Map<String, String> values = {
      'key': key.name,
      'value': val,
    };

    int res = await _db?.update(
          'Params',
          values,
          where: 'key = ?',
          whereArgs: [key.name],
          conflictAlgorithm: ConflictAlgorithm.replace,
        ) ??
        0;

    if (res == 0) {
      res = await _db?.insert('Params', values) ?? 0;
    }

    WriteLogs.storageSQflite(
        'setRecord key: ${key.name} [${DateTime.now().millisecondsSinceEpoch - st}ms]');
    return (res != 0);
  }

  Future<String?> getRecord(PrefName key) async {
    var st = DateTime.now().millisecondsSinceEpoch;
    List<Map<String, Object?>>? res =
        await _db?.query('Params', where: 'key = ?', whereArgs: [key.name]);

    WriteLogs.storageSQflite(
        'getRecord key: ${key.name} [${DateTime.now().millisecondsSinceEpoch - st}ms]');
    if ((res?.length ?? 0) > 0) {
      return res?.first['value'].toString();
    } else {
      return null;
    }
  }

  Future<int> delRecord(PrefName key) async {
    var st = DateTime.now().millisecondsSinceEpoch;
    var res = await _db?.delete('Params', where: 'key = ?', whereArgs: [key.name]) ?? 0;
    WriteLogs.storageSQflite(
        'delRecord key: ${key.name} [${DateTime.now().millisecondsSinceEpoch - st}ms]');
    return res;
  }

  Future<void> clearAll() async {
    var st = DateTime.now().millisecondsSinceEpoch;
    await _db?.delete('Params');
    await _db?.delete('OffLineData');
    WriteLogs.storageSQflite('clearAll [${DateTime.now().millisecondsSinceEpoch - st}ms]');
  }

  Future<bool> setHTTPcache(String key, String val) async {
    var st = DateTime.now().millisecondsSinceEpoch;
    Map<String, String> values = {
      'key': key,
      'value': val,
    };

    int res = await _db?.update(
          'OffLineData',
          values,
          where: 'key = ?',
          whereArgs: [key],
        ) ??
        0;

    if (res == 0) {
      res = await _db?.insert('OffLineData', values) ?? 0;
    }

    WriteLogs.storageSQflite(
        'setHTTPcache key: $key [${DateTime.now().millisecondsSinceEpoch - st}ms]');
    return (res != 0);
  }

  Future<String?> getHTTPcache(String key) async {
    var st = DateTime.now().millisecondsSinceEpoch;
    List<Map<String, Object?>>? res =
        await _db?.query('OffLineData', where: 'key = ?', whereArgs: [key]);

    WriteLogs.storageSQflite(
        'getHTTPcache key: $key [${DateTime.now().millisecondsSinceEpoch - st}ms]');
    if ((res?.length ?? 0) > 0) {
      return res?.first['value'].toString();
    } else {
      return null;
    }
  }

  Future<void> clearCache() async {
    WriteLogs.storageSQflite('clearCache');
    await _db?.delete('OffLineData');
  }
}
