import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:terang_express/helpers/address_search.dart';
import 'package:uuid/uuid.dart';

class MapsView extends StatefulWidget {
  Address address;

  @override
  _MapsViewState createState() => _MapsViewState(address);

  MapsView(this.address);
}

class _MapsViewState extends State<MapsView> {

  _MapsViewState(this.currentAddress);

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(-6.932694, 107.627449);
  final Set<Marker> _markers = {};
  MapType _currentMapType = MapType.normal;
  final searchController = TextEditingController();

  LatLng currentLocation;
  GoogleMapController googleMapController;

  Address currentAddress;

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
    googleMapController = controller;
    if(currentAddress == null){
      _getLastKnownLocation();
      _getLocation();
    } else {
      currentLocation = new LatLng(currentAddress.coordinates.latitude, currentAddress.coordinates.longitude);
      setLocation();
    }
  }

  _getLastKnownLocation() async {
    Position new_position = await getLastKnownPosition();
    if(new_position != null) {
      currentLocation =
      new LatLng(new_position.latitude, new_position.longitude);
      googleMapController.animateCamera(CameraUpdate.newLatLng(currentLocation));
      setLocation();
    }
  }

  _getLocation() async {
    Position new_position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentLocation = new LatLng(new_position.latitude, new_position.longitude);
    googleMapController.animateCamera(CameraUpdate.newLatLng(currentLocation));
    setLocation();
  }

  _handleTap(LatLng point) {
    currentLocation = point;
    setLocation();
  }

  setLocation() async{
    List<Address> addresses = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(currentLocation.latitude, currentLocation.longitude));
    currentAddress = addresses.first;
    final markerId = MarkerId("here");
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: markerId,
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: currentAddress.addressLine),
      );
      _markers.add(marker);
    });

    await Future.delayed(Duration(seconds: 1));
    googleMapController.showMarkerInfoWindow(markerId);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(currentAddress),
            child: Text("Pilih"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        title: TextField(
          controller: searchController,
          onTap: () async {
            // generate a new token here
            final sessionToken = Uuid().v4();
            final String address = await showSearch(
              context: context,
              delegate: AddressSearch(sessionToken),
            );
            // This will change the text displayed in the TextField
            if (address != null) {
              List<Address> addresses = await Geocoder.local.findAddressesFromQuery(address);
              currentLocation = new LatLng(addresses.first.coordinates.latitude, addresses.first.coordinates.longitude);
              googleMapController.animateCamera(CameraUpdate.newLatLng(currentLocation));
              searchController.text = address;
              setLocation();
            }
          },
          decoration: InputDecoration(
            hintText: "Cari Alamat",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: currentLocation ?? _center ,
              zoom: 17.0
            ),
            mapType: _currentMapType,
            markers: _markers,
            onTap: _handleTap,
          )
        ],
    ),
    );
  }
}
