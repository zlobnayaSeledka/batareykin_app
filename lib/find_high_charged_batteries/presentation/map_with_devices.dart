import 'dart:async';

import 'package:batareykin/_design/color_theme.dart';
import 'package:batareykin/_design/design_parameters.dart';
import 'package:batareykin/_design/widgets/box_with_data.dart';
import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../domain/map_settings.dart';

class MapScreen extends StatefulWidget {
 const MapScreen({Key? key}) : super(key: key);

 @override
 State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
 final mapControllerCompleter = Completer<YandexMapController>();
 String deviceNumber = '1234';
 int batteriesCount = 5;
 bool showDeviceData = false;
 String adress = 'г.Москва, Олимпийский проспект, д.11';
 Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<AppLatLong> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
    return location;
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
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
  void initState() {
    super.initState();
    _initPermission().ignore();
    mapObjects.add(
      PlacemarkMapObject(
        onTap: (mapObject, point){
          onMapIconTap();
        },
        opacity: 1,
        point: const Point(latitude: 55.78955106621894, longitude: 37.62186532401539),
        mapId: MapObjectId('device1 location'),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage('lib/_assets/images/device_location.png'), 
            scale: 0.15, 
          )
        )
      )
    );
      
  }
  void onMapIconTap(){
    setState(() {
      showDeviceData = true;
    });
  }
  List<PlacemarkMapObject> mapObjects = [];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    floatingActionButton: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [DesignParameters.mainShadow],
                  color: ColorTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(DesignParameters.mainBorderRadius)
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          CustomBackButton(),
                          CustomTitleText(text: 'Автоматы с батарейками', size: 18)
                        ],
                                      ),
                    ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: showDeviceData,
            child: Padding(
              padding: const EdgeInsets.only(left:30.0, bottom: 10.0),
              child: BoxWithData(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    GestureDetector(
                            onTap: (){
                              setState(() {
                                showDeviceData = false;
                              });
                            }, 
                            child: Icon(Icons.close, color: ColorTheme.descriptionTextColor, size: 20)
                          ),
                          
                      SizedBox(height: 10),
                      Row(
                        children: [
                          
                          CustomDescriptionText(text: adress)
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTitleText(text: '№$deviceNumber', size: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTitleText(text: batteriesCount.toString(), size: 18),
                              SizedBox(height: 5),
                              CustomDescriptionText(text: 'батареек', size: 16)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ),
            )
          )
        ],
      ),
    ),
     body: YandexMap(
       mapObjects: mapObjects,
       onMapCreated: (controller) async{
         mapControllerCompleter.complete(controller);
         AppLatLong myLocation = await _fetchCurrentLocation();
         setState(() {
          mapObjects.add(
              PlacemarkMapObject(
                opacity: 1,
                point: Point(latitude: myLocation.lat, longitude: myLocation.long),
                mapId: MapObjectId('current location'),
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage('lib/_assets/images/current_location.png'), 
                    scale: 1.5, 
                    
                  )
                )
              )
            );
         });
       },
     ),
   );
 }
}

