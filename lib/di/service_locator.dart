import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vtb_hack/data/enum.dart';
import 'package:vtb_hack/data/network/api/map_api.dart';
import 'package:vtb_hack/data/network/dio_client.dart';
import 'package:vtb_hack/data/storage/pref_storage.dart';
import 'package:vtb_hack/domain/repository/map_repository.dart';

final getIt = GetIt.instance;

Future<bool> setup(StreamController<GlobalEvents> gs) async {
  await PrefStorageInstance.load();

  final storage = PrefStorage();
  getIt.registerSingleton<PrefStorage>(
    storage,
  );

  getIt.registerSingleton<Dio>(Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90)));
  getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));

  getIt.registerSingleton(MapApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(MapRepository(mapApi: getIt.get<MapApi>()));

  return true;
}
