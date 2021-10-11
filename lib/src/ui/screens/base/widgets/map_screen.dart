import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jica/src/ui/screens/base/widgets/directions_model.dart';
import 'package:jica/src/ui/screens/base/widgets/directions_repository.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            markers: {
              Marker(
                markerId: const MarkerId('marker1'),
                infoWindow: const InfoWindow(title: 'Destination'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
                position: LatLng(37.473972, -122.431297),
              ),
              Marker(
                markerId: const MarkerId('marker2'),
                infoWindow: const InfoWindow(title: 'Marker'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
                position: LatLng(37.573972, -122.431297),
              ),
              Marker(
                markerId: const MarkerId('marker3'),
                infoWindow: const InfoWindow(title: 'Destination'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
                position: LatLng(37.673972, -122.431297),
              ),
              Marker(
                markerId: const MarkerId('marker4'),
                infoWindow: const InfoWindow(title: 'Destination'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet),
                position: LatLng(37.673972, -122.331297),
              ),
              Marker(
                markerId: const MarkerId('marker5'),
                infoWindow: const InfoWindow(title: 'Destination'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueYellow),
                position: LatLng(37.873972, -122.331297),
              ),
            },
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
}
