import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SessionPage extends StatefulWidget {
  final Future<BicycleSessionResult> result;
  final BicycleSession session;
  final PlacemarkMapObject startPlacemark;
  final PlacemarkMapObject endPlacemark;

  const SessionPage(this.startPlacemark, this.endPlacemark, this.session, this.result, {super.key});

  @override
  SessionState createState() => SessionState();
}

class SessionState extends State<SessionPage> {
  late final List<MapObject> mapObjects = [widget.startPlacemark, widget.endPlacemark];

  final List<BicycleSessionResult> results = [];
  bool progress = true;

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    super.dispose();

    _close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            YandexMap(
              mapObjects: mapObjects,
              onMapCreated: (YandexMapController yandexMapController) async {
                final boundingBox = BoundingBox(
                    northEast: widget.startPlacemark.point, southWest: widget.endPlacemark.point);

                await yandexMapController.moveCamera(CameraUpdate.newBounds(boundingBox));
                await yandexMapController.moveCamera(CameraUpdate.zoomOut());
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 10.0,
                        offset: const Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Color(0xFF0184FE),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _close() async {
    await widget.session.close();
  }

  Future<void> _init() async {
    await _handleResult(await widget.result);
  }

  Future<void> _handleResult(BicycleSessionResult result) async {
    setState(() {
      progress = false;
    });

    if (result.error != null) {
      return;
    }

    setState(() {
      results.add(result);
    });
    setState(() {
      result.routes!.asMap().forEach((i, route) {
        mapObjects.add(PolylineMapObject(
          mapId: MapObjectId('route_${i}_polyline'),
          polyline: Polyline(points: route.geometry),
          strokeColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          strokeWidth: 3,
        ));
      });
    });
  }
}
