import 'dart:async';
import 'package:flutter/material.dart';
import '../flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../constant/color_constant.dart';
import '../constant/string_constant.dart';
import '../screens/home_page/sub_screen.dart';

class OceanParkPage extends StatefulWidget {
  @override
  OceanParkPageState createState() => OceanParkPageState();
}

class OceanParkPageState extends State<OceanParkPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 11.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          // // _zoomm.inusfunction(),
          // // _zoomplusfunction(),
          _buildContainer(),

          Positioned(
              top: 45.h,
              left: 25.w,
              right: 25.w,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: kGreyBlueColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: kWhiteColor,
                        )),
                  ),
                  SizedBox(
                    width: 220.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: kGreyBlueColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      height: 45.h,
                      width: 45.w,
                      child: Icon(
                        Icons.more_vert,
                        color: kWhiteColor,
                      )),
                ],
              ))
        ],
      ),
    );
  }

  // Widget _zoomminusfunction() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 95,left: 20),
  //     child: IconButton(
  //         icon: const Icon(FontAwesomeIcons.searchMinus, color: kGreyBlueColor),
  //         onPressed: () {
  //           zoomVal--;
  //           _minus(zoomVal);
  //         }),
  //   );
  // }
  // Widget _zoomplusfunction() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 95,left: 320),
  //     child: IconButton(
  //         icon: const Icon(FontAwesomeIcons.searchPlus, color: kGreyBlueColor),
  //         onPressed: () {
  //           zoomVal++;
  //           _plus(zoomVal);
  //         }),
  //   );
  // }
  // Future<void> _minus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(target: LatLng(18.922370, 72.834504), zoom: zoomVal)));
  // }
  // Future<void> _plus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(target: LatLng(18.922370, 72.834504), zoom: zoomVal)));
  // }
  Widget _buildContainer() {
    return Container(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(Icons.location_on, 18.922370, 72.834504, clubHallandale),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(Icons.location_on, 18.982990, 72.808954, park),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(Icons.location_on, 19.017049, 72.830228, chateauResidences),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(Icons.location_on, 19.099074, 72.826454, park),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                  Icons.location_on,
                  18.941693,
                  72.823619,
                  clubHallandale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boxes(IconData? icon, double lat, double long, String placeName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer1(
                      placeName,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: kPurpleColor,
                size: 25.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                restaurantName,
                style: TextStyle(color: kBlackColor, fontSize: 20.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                price1,
                style: TextStyle(fontFamily: "Mulish", color: kGreenColor, fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SubOceanPage(),
              ),
            );
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Safety",
                    style: TextStyle(color: kGreyColor, fontSize: 18.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Job Growth",
                    style: TextStyle(color: kGreyColor, fontSize: 18.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Education",
                    style: TextStyle(color: kGreyColor, fontSize: 18.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                width: 130.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "8/10",
                    style: TextStyle(color: kBlackColor, fontSize: 18.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "6/10",
                    style: TextStyle(color: kBlackColor, fontSize: 18.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "9/10",
                    style: TextStyle(color: kBlackColor, fontSize: 18.sp, fontFamily: "Mulish", fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(18.922370, 72.834504), zoom: 11),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {clubHallandaleMarker, parkMarker, chateauResiMarker, parkMarker, chateauResiMarker},
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker clubHallandaleMarker = Marker(
  markerId: const MarkerId(clubHallandale),
  position: const LatLng(18.922370, 72.834504),
  infoWindow: const InfoWindow(title: clubHallandale),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker parkMarker = Marker(
  markerId: const MarkerId(park),
  position: const LatLng(18.982990, 72.808954),
  infoWindow: const InfoWindow(title: park),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker chateauResiMarker = Marker(
  markerId: MarkerId(chateauResidences),
  position: LatLng(19.017049, 72.830228),
  infoWindow: InfoWindow(title: chateauResidences),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
//New York Marker
Marker parMarker = Marker(
  markerId: MarkerId(park),
  position: LatLng(19.099074, 72.826454),
  infoWindow: InfoWindow(title: park),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker clubHallaMarker = Marker(
  markerId: MarkerId(clubHallandale),
  position: LatLng(18.941693, 72.823619),
  infoWindow: InfoWindow(title: clubHallandale),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
