import 'sqflite/storage.dart';

class PrefStorageInstance {
  PrefStorageInstance();

  static PrefStorageInstance? _insctance;

  static PrefStorageInstance get insctance {
    assert(_insctance != null,
        'No instance of PrefStorageInstance was loaded. Try to initialize the PrefStorageInstance delegate');
    return _insctance!;
  }

  static PrefStorage prefStorage = PrefStorage();

  static Future<PrefStorageInstance> load() async {
    final instance = PrefStorageInstance();

    PrefStorageInstance._insctance = instance;
    await PrefStorageInstance.prefStorage.init();

    return instance;
  }
}

class PrefStorage extends SecureStorageSQflite {
  @override
  Future<bool> setRecord(PrefName key, String val);

  @override
  Future<String?> getRecord(PrefName key);

  @override
  Future<bool> setInt(PrefName key, int val);

  @override
  Future<int?> getInt(PrefName key);

  @override
  Future<bool> setBool(PrefName key, bool val);

  @override
  Future<bool?> getBool(PrefName key);

  @override
  Future<bool> setList(PrefName key, List<String> val);

  @override
  Future<List<String>?> getList(PrefName key);

  @override
  Future<int> delRecord(PrefName key);

  @override
  Future<void> clearAll();

  /// save http response on DB
  @override
  Future<bool> setHTTPcache(String key, String val);

  /// read cache form DB when HTTP is not response
  @override
  Future<String?> getHTTPcache(String key);

  /// clear HTTP cache from DB
  @override
  Future<void> clearCache();
}

enum PrefName {
  userId,
  refreshToken,
}
