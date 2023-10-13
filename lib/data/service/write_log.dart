import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vtb_hack/core/constants.dart';

abstract class WriteLogs {
  static Future<void> write(String text) async {
    // ignore: avoid_print
    if (!kReleaseMode) print(text);
    if (AppConstants.writeLogs) {
      String res = '';
      try {
        List<Directory>? pathLoc =
            await getExternalStorageDirectories(type: StorageDirectory.documents);
        final String path =
            (pathLoc != null) ? pathLoc[pathLoc.length - 1].path : '/storage/sdcard/0/Download';
        final File file = File('$path/log_file.txt');
        FileMode mode = (await file.exists()) ? FileMode.append : FileMode.write;
        res = path;
        // ignore: avoid_print
        if (!kReleaseMode) print(res);
        await file.writeAsString('${DateTime.now()}\t$text\n', mode: mode);
      } catch (e) {
        // ignore: avoid_print
        if (!kReleaseMode) print(e.toString());
        res = e.toString();
      }
    }
  }

  static notifyLog(String text) {
    if (AppConstants.printLogChangeNotify) {
      debugPrint('notifyListeners: $text');
    }
  }

  static storageSQflite(String text) {
    if (AppConstants.storageSQfliteLogs) {
      debugPrint('[StorageSQflite] $text');
    }
  }
}
