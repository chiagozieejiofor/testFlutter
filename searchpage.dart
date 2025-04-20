import 'dart:ui' as ui;
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hugeicons/hugeicons.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
// Closing Google Map Shinenigans

  bool _isBottomSheetVisible = false;
  double _bottomSheetHeight = 0.0; // Initial height (hidden)
  final double _minBottomSheetHeight = 0.32; // Minimum height (20%)
// Maximum height (90%)
  int selectedIndex = 0;

  void callState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    determinePosition(callState);
    loadMarkers(callState);

    // Show the bottom sheet on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isBottomSheetVisible = true;
        _bottomSheetHeight =
            _minBottomSheetHeight; // Start at the minimum height
      });
    });
  }


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  bool _showMenu = false;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          // Animated search bar

          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    scrollGesturesEnabled: true,

                    rotateGesturesEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude),
                      zoom: 13.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      String style = await rootBundle.loadString('assets/map_style.json');

                      // Apply the style to the controller
                      controller.setMapStyle(style);
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Apo Hill top, Abuja",
                        hintStyle: GoogleFonts.poppins(fontSize: 13),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )
                        .animate()
                        .scaleXY(duration: const Duration(milliseconds: 800)),
                  )

                ),
                const SizedBox(width: 5,),
                Container(
                  height:40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HugeIcon(icon: HugeIcons.strokeRoundedFilterVertical, color: Colors.grey),
                  ),
                ).animate()
                    .scaleXY(

                    duration: const Duration(milliseconds: 800)),
              ],
            ),
          ),
          // Right Floating Button
          Positioned(
            bottom: 100,
            right: 16,
            child:
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(24)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [
                      HugeIcon(icon: HugeIcons.strokeRoundedMenu02, color: Colors.white),
                      Text('List of Variants', style: GoogleFonts.poppins(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),





          // Left Floating Button
          Positioned(
            bottom: 100,
            left: 16,
            child: Column(

              children: [

                SizedBox(
                  height: 40,
                  child:  FloatingActionButton(
                        
                      shape: const CircleBorder(),
                      onPressed: () {
                          setState(() {
                            _showMenu = !_showMenu;
                          });
                      },
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      child: HugeIcon(

                          icon: HugeIcons.strokeRoundedServerStack03, color: Colors.white),
                    ),
                  ),

                const SizedBox(height: 8,),
                SizedBox(
                  height: 40,
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    onPressed: () {
                      // Do something
                    },
                    backgroundColor: Colors.grey.withOpacity(0.7),
                    child: HugeIcon(icon: HugeIcons.strokeRoundedArrowDataTransferDiagonal, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          /// Custom animated marker because Google map flutter
          /// doesn't allow custom widget on the map,
          /// so we just create this for reach deadline for the interview.

          Positioned(
              top: 250,
              right: 150,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFfc8c03),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [

                      Text('Guzape, 95w', style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
          ).animate()
              .scaleXY(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 800)),

          Positioned(
              top: 300,
              right: 130,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: 85,
                decoration: const BoxDecoration(
                    color: Color(0xFFfc8c03),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [

                      Text('Apo, 2355w', style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
          ).animate()
              .scaleXY(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 900)),

          Positioned(
              top: 300,
              right: 40,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color(0xFFfc8c03),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [

                      Text('95w', style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
          ).animate()
              .scaleXY(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 800)),

          Positioned(
              top: 400,
              right: 10,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFfc8c03),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [

                      Text('Maitama Gate', style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
          ).animate()
              .scaleXY(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 900)),

          Positioned(
              top: 450,
              right: 200,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFfc8c03),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [

                      Text('Maitama Gate', style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
          ).animate()
              .scaleXY(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 1500)),

          Positioned(
              top: 530,
              right: 10,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFfc8c03),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    children: [

                      Text('Kubwa 14E', style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
          ).animate()
                  .scaleXY(
              alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 1000)),

          // pop up
          if (true) ...[
            Positioned(
                bottom: 200,
                left: 30,
                child: _popupItem("Hospitals")).animate(
                target: _showMenu ? 1 : 0

            ).scaleXY(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.bottomLeft),
            const SizedBox(height: 8),
          ],

        ],
      ),

    );
  }
}

/// Map factors
String? _selectedPlace; // Store the selected marker info
Set<Marker> _markers = {};
dynamic latitude = 8.9621655;
dynamic longitude = 7.506368;

//Google Map Shinenigans
final Completer<GoogleMapController> _controller =
Completer<GoogleMapController>();

/// Add markers with popups
Future<void> loadMarkers(Function() callState) async {
  BitmapDescriptor customIcon =
  await _createCustomMarkerIcon(Icons.location_on, Colors.red);
  _markers.addAll([
    Marker(
      markerId: const MarkerId("marker1"),
      position: LatLng(latitude, longitude),
      icon: customIcon,
      onTap: () {
        _showPopup("Lagos Island", "A beautiful place in Lagos.", callState);
      },
    ),
    Marker(
      markerId: const MarkerId("marker2"),
      position: const LatLng(9.072264, 7.491302),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      onTap: () {
        _showPopup("Ikeja", "The capital of Lagos State.", callState);
      },
    ),
  ]);
}

/// Convert Flutter Icons into a BitmapDescriptor
Future<BitmapDescriptor> _createCustomMarkerIcon(
    IconData icon, Color color) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = color;

  // Draw the background circle

  // Draw the icon
  TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
  textPainter.text = TextSpan(
    text: String.fromCharCode(icon.codePoint),
    style: TextStyle(
      fontSize: 100,
      fontFamily: icon.fontFamily,
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  );
  textPainter.layout();
  textPainter.paint(
      canvas, Offset(50 - textPainter.width / 2, 50 - textPainter.height / 2));

  final img = await pictureRecorder.endRecording().toImage(100, 100);
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}

/// Display a popup when marker is tapped
void _showPopup(String title, String description, Function() callState) {
  _selectedPlace = "$title\n$description";
  callState();
}

/// GeoLocator Shinenigans
//Function to check location permission and get current location
Future<Position> determinePosition(Function() callState) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  var Templatitude = await Geolocator.getCurrentPosition();
  latitude = Templatitude.latitude;
  longitude = Templatitude.longitude;

  // Move the camera to the new location
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
  await loadMarkers(callState);

  return Templatitude;
}


//Map directions
Set<Polyline> polylines2 = {};

dynamic routePoints2;



Widget _popupItem(String title) {
  return IntrinsicWidth(
    child: AnimatedContainer(
      height: 150,
      duration: const Duration(milliseconds: 3000),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(

              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkBadge01, color: Colors.grey),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Cozy Area',
                    style:  GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(

              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedWallet03, color: Colors.orangeAccent),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Price',
                    style:  GoogleFonts.poppins(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only( right: 16),
            child: Row(

              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkBadge01, color: Colors.grey),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Infrastructure',
                    overflow: TextOverflow.ellipsis,
                    style:  GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}



