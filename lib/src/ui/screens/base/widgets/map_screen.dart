import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jica/src/core/models/device_location.dart';
import 'package:jica/src/ui/screens/base/widgets/directions_model.dart';
import 'package:jica/src/ui/screens/base/widgets/directions_repository.dart';
import 'package:jica/src/utils/debugBro.dart';

class MapScreen extends StatefulWidget {
  final Map<String, dynamic> groupedDeviceLocations;

  const MapScreen({Key key, @required this.groupedDeviceLocations})
      : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-24.653257, 25.906792),
    zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;
  Set<Marker> markers = Set();
  int countMarkers = 0;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    //logger.e(markers.first);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.groupedDeviceLocations != null &&
        widget.groupedDeviceLocations.isNotEmpty) {
      widget.groupedDeviceLocations?.forEach((k, v) {
        countMarkers++;

        List<DeviceLocation> routeDetails = v.reversed.toList();
        double lat = routeDetails[0].latitude;
        double long = routeDetails[0].longitude;

        markers.add(
          Marker(
              markerId: MarkerId('$k'),
              infoWindow: InfoWindow(title: 'Device $k'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              position: LatLng(lat, long),
              onTap: () => onMarkerTapped(deviceId: k, routeDetails: v)),
        );
      });
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            mapType: MapType.hybrid,
            markers: markers,
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController?.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
    }
  }

  onMarkerTapped({String deviceId, List<DeviceLocation> routeDetails}) {}
}
