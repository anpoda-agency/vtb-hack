import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:vtb_hack/core/constants.dart';
import 'package:vtb_hack/data/models/local/app_geolocation_model.dart';
import 'package:vtb_hack/data/models/offers/department_request.dart';
import 'package:vtb_hack/data/service/location_service/location_service.dart';
import 'package:vtb_hack/domain/repository/map_repository.dart';
import 'package:vtb_hack/features/core_widgets/custom_bottom_sheet.dart';
import 'package:vtb_hack/features/filter_page/ui/filter_page.dart';
import 'package:vtb_hack/features/map_page/bloc/map_page_bloc.dart';
import 'package:vtb_hack/features/route_page/route_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapObjectId mapObjectId = const MapObjectId('map_object_collection');
  final mapControllerCompleter = Completer<YandexMapController>();
  YandexMapController? controller;
  Timer? _debounce;
  List<MapObject> mapObjects = [];
  TextEditingController textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool credit = false;
  bool card = false;
  bool indper = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapPageBloc(
        mapRepository: context.read<GetIt>().get<MapRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<MapPageBloc, MapPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.black,
                statusBarColor: Colors.black,
              ),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  YandexMap(
                    mapObjects: mapObjects,
                    onMapLongTap: (geoObject) {},
                    onCameraPositionChanged: (cameraPosition, reason, finished) {
                      if (finished) {
                        drawPlacemarks(state.pageState);
                      }
                    },
                    mapType: MapType.map,
                    onMapCreated: (yandexMapController) async {
                      mapControllerCompleter.complete(yandexMapController);
                      setState(() {
                        controller = yandexMapController;
                      });
                      await _initPermission().then((value) => context
                          .read<MapPageBloc>()
                          .add(MapPageLoadDepartments(lat: value.latitude, long: value.longitude)));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 10.0,
                                  offset: const Offset(5.0, 5.0),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: TextFormField(
                                    onTapOutside: (event) => _focusNode.unfocus(),
                                    focusNode: _focusNode,
                                    controller: textEditingController,
                                    decoration: const InputDecoration(
                                      hintText: 'Поиск',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, left: 10),
                                  child: SvgPicture.asset(
                                    '${AppConstants.icons}search_icon.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            DepartmentRequest? res = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => FilterPage(
                                          requestFromPrevPage: state.pageState.request,
                                        )));
                            if (res != null) {
                              // ignore: use_build_context_synchronously
                              context.read<MapPageBloc>().add(MapPageLoadUpdateFilter(value: res));
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 10.0,
                                  offset: const Offset(5.0, 5.0),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SvgPicture.asset(
                              '${AppConstants.icons}filter_icon.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> drawPlacemarks(PageState pageState) async {
    mapObjects.clear();
    for (var i in pageState.response) {
      int full = i.workload.toInt();
      int pure = 5 - full;
      var object = PlacemarkMapObject(
        onTap: (mapObject, point) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(const Duration(milliseconds: 100), () {
            CustomBottomSheet(
                context: context,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(i.department,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text('Загруженность:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        calcWorkloadWidget(pure: pure, full: full),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => const BicyclePage()));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(const Color(0xFF0184FE)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            'Построить маршрут',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ))),
                    ),
                  ],
                )).show();
          });
        },
        opacity: 1,
        point: Point(latitude: i.latitude, longitude: i.longitude),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2,
            image: BitmapDescriptor.fromAssetImage('${AppConstants.icons}placemark_icon.png'))),
        mapId: MapObjectId('item_${pageState.response.indexOf(i)}'),
      );
      setState(() {
        mapObjects.add(object);
      });
    }
  }

  Widget calcWorkloadWidget({required int full, required int pure}) {
    return Row(
      children: [
        if (full > 0)
          ...List.generate(
            full,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                '${AppConstants.icons}full_person_icon.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        if (pure > 0)
          ...List.generate(
            pure,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                '${AppConstants.icons}pure_person_icon.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
      ],
    );
  }

  Future<Point> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    return await _fetchCurrentLocation();
  }

  Future<Point> _fetchCurrentLocation() async {
    AppLocationModel location;
    const defLocation = SaratovLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    await _moveToCurrentLocation(location);
    return Point(latitude: location.lat, longitude: location.long);
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

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
