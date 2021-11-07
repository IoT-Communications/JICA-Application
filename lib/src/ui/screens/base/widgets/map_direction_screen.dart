import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jica/src/core/models/device_location.dart';
import 'package:jica/src/ui/screens/base/widgets/alarm_device_information.dart';
import 'package:jica/src/ui/screens/base/widgets/battery_device_information.dart';
import 'package:jica/src/services/google_maps_services.dart';
import 'package:jica/src/ui/screens/base/widgets/health_device_information.dart';
import 'package:jica/src/ui/screens/base/widgets/sos_device_information.dart';
import 'package:jica/src/ui/screens/base/widgets/temp_device_information.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/debugBro.dart';
import 'package:jica/src/utils/routes.dart';
import 'package:location/location.dart';
import 'dart:async';

import 'package:random_string/random_string.dart';

class MapDirectionScreen extends StatefulWidget {
  final String deviceId;
  final List<DeviceLocation> routes;

  const MapDirectionScreen({Key key, this.deviceId, this.routes})
      : super(key: key);

  @override
  State<MapDirectionScreen> createState() => _MapDirectionScreenState();
}

class _MapDirectionScreenState extends State<MapDirectionScreen> {
  bool loading = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  Set<Polyline> get polyLines => _polyLines;
  GoogleMapController _mapController;
  static LatLng latLng;
  LocationData currentLocation;
  Future<bool> isMapReady;
  bool hasNoRoute = false;
  LatLng _center, _source, _destination;

  double CAMERA_ZOOM = 10;
  double CAMERA_TILT = 0;
  double CAMERA_BEARING = 30;
  int _selectedIndex = 0;
  int index = 0;

  PageController pageController;
  StreamController<int> indexcontroller = StreamController<int>.broadcast();

  @override
  void initState() {
    Future.microtask(() => getCoodinates());
    pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }

  void getCoodinates() {
    for (var i = 0; i < widget.routes.length; i++) {
      DeviceLocation deviceLocation = widget.routes[i];

      var latLng = LatLng(deviceLocation.latitude, deviceLocation.longitude);

      DateTime parsedDateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
          .parseUTC(deviceLocation.timestamp)
          .toLocal(); // parse String datetime to DateTime and get local date time

      String formatedDateTime = DateFormat.yMd()
          .add_jm()
          .format(parsedDateFormat)
          .toString(); // convert local date time to string format local date time

      if (i == widget.routes.length - 1 || i == 0)
        _addMarker(latLng, "Last Seen", formatedDateTime, i);

      if (i != 0) {
        _destination = latLng;
        _googleMapsServices
            .getRouteCoordinates(_source, _destination)
            .then((route) {
          // }
          if (route != null) {
            setState(() {
              createRoute(route, randomString(100));
              hasNoRoute = true;
            });
          }
        });
        _source = latLng;
      } else {
        _source = latLng;
        _center = latLng;
      }
    }
    if (!hasNoRoute) {
      setState(() {
        hasNoRoute = true;
      });
    }
  }

  void onCameraMove(CameraPosition position) {
    latLng = position.target;
  }

  // ! ON CREATE
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      getCoodinates();
    });
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(),
        backgroundColor: kLightAccent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          this.index = index;
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          _center == null
              ? hasNoRoute
                  ? Center(
                      child: Container(
                        child: Text("No recorded tracks for this device."),
                      ),
                    )
                  : Center(child: CupertinoActivityIndicator())
              : GoogleMap(
                  onMapCreated: onCreated,
                  initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: CAMERA_ZOOM,
                      bearing: CAMERA_BEARING,
                      tilt: CAMERA_TILT),
                  mapType: MapType.hybrid,
                  myLocationEnabled: false,
                  polylines: _polyLines,
                  markers: _markers,
                  compassEnabled: true,
                  mapToolbarEnabled: true,
                  zoomGesturesEnabled: true,
                  buildingsEnabled: true,
                ),
          BatteryDeviceInformation(
            deviceID: widget.deviceId,
          ),
          HealthDeviceInformation(
            deviceID: widget.deviceId,
          ),
          DeviceTemperatureInformation(
            deviceID: widget.deviceId,
          ),
          DeviceAlarmInformation(
            deviceID: widget.deviceId,
          ),
          DeviceSOSInformation(
            deviceID: widget.deviceId,
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  getCoodinates();
                });
              },
              label: Text('Refresh Routes'),
              icon: Icon(Icons.directions_sharp),
            )
          : SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.battery_alert,
              color: Colors.purple,
            ),
            label: 'Battery',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.thermostat,
              color: Colors.green,
            ),
            label: 'Temp',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              color: Colors.blue,
            ),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
              color: Colors.pink,
            ),
            label: 'SOS',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kLightAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  // ! TO CREATE ROUTE
  void createRoute(String encondedPoly, String tag) {
    _polyLines.add(Polyline(
        polylineId: PolylineId(tag),
        width: 2,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.blue));
  }

  // ! ADD A MARKER ON THE MAO
  void _addMarker(LatLng location, String title, String msg, int i) {
    _markers.add(Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: InfoWindow(
            title: i == 0 ? 'Initial Position' : title, snippet: msg),
        icon: i == 0
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarkerWithHue(140)));
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];
    return lList;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  Widget title() {
    String _title = '';
    switch (index) {
      case 0:
        _title = 'Device Location Info';
        break;
      case 1:
        _title = 'Device Battery Info';
        break;

      case 2:
        _title = 'Device Health Info';
        break;

      case 3:
        _title = 'Device Temperature Info';
        break;

      case 4:
        _title = 'Device Alarm Info';
        break;
      case 5:
        _title = 'Device SOS Info';
        break;

      default:
    }
    return Text(_title);
  }
}
