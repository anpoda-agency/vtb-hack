import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vtb_hack/data/models/local/app_geolocation_model.dart';
import 'package:vtb_hack/data/service/location_service/location_service.dart';
import 'package:vtb_hack/domain/repository/map_repository.dart';
import 'package:vtb_hack/features/map_page/bloc/map_page_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapPageBloc(
        mapRepository: context.read<GetIt>().get<MapRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<MapPageBloc, MapPageState>(
        listener: (context, state) {
          // if (state is AuthSmsCodeAllowedToPush) {
          //   context.read<RouteImpl>().go(MapRoutes.map.name);
          // }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.black, // Navigation bar
                statusBarColor: Colors.black, // Status bar
              ),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: YandexMap(
              onMapLongTap: (geoObject) {
                print(geoObject.latitude);
                print(geoObject.longitude);
              },
              onCameraPositionChanged: (cameraPosition, reason, finished) {
                // cameraPosition
              },
              mapType: MapType.map,
              onMapCreated: (controller) {
                mapControllerCompleter.complete(controller);
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLocationModel location;
    const defLocation = SaratovLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLocationModel appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}
