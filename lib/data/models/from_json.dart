class FromJsonBase {
  static bool jsonToBool(Object? json) => (json is bool)
      ? json
      : (json.toString() == 'true')
          ? true
          : false;

  static int jsonToInt(Object? json) => (json is int)
      ? json
      : (json == null)
          ? 0
          : int.tryParse(json.toString()) ?? 0;

  static String jsonToString(Object? json) => (json is String)
      ? quotReplace(json)
      : (json == null)
          ? ''
          : quotReplace(json.toString());

  static DateTime? jsonToDateTime(Object? json) =>
      (json is String) ? DateTime.tryParse(json) : null;

  static double jsonToDouble(Object? json) => (json is double)
      ? json
      : (json == null)
          ? 0.0
          : double.tryParse(json.toString()) ?? 0.0;

  static List<String> jsonToListString(Object? json) =>
      (json is List) ? json.map((e) => jsonToString(e)).toList() : [];

  static List<int> jsonToListInt(Object? json) =>
      (json is List) ? json.map((e) => jsonToInt(e)).toList() : [];

  static List<bool> jsonToListBool(Object? json) =>
      (json is List) ? json.map((e) => jsonToBool(e)).toList() : [];

  static Map<String, bool> jsonToMapBool(Object? json) =>
      (json is Map) ? json.map((key, value) => MapEntry(key.toString(), jsonToBool(value))) : {};

  static Map<String, String> jsonToMapString(Object? json) =>
      (json is Map) ? json.map((key, value) => MapEntry(key.toString(), jsonToString(value))) : {};

  static Map<String, int> jsonToMapInt(Object? json) =>
      (json is Map) ? json.map((key, value) => MapEntry(key.toString(), jsonToInt(value))) : {};

  static String quotReplace(String val) {
    var st = val.split('&quot;');
    if (st.length > 1) {
      return st.join('"');
    } else {
      return val;
    }
  }

  // static List<T> jsonToList<T>(Object? json) => (json is List<T>)
  //     ? json
  //     : const [];

  // static Map<T,E> jsonToMap<T,E>(Object? json) => (json is Map<T,E>)
  //     ? json
  //     : const {};
}
