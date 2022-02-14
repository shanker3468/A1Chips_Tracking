
import 'dart:async';
import 'dart:convert';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vector_math/vector_math.dart' as Vmath;


class Myattendance extends StatefulWidget {
  Myattendance({Key key}) ;

  @override
  CheckIN createState() => CheckIN();
}

class CheckIN extends State<Myattendance> {



  double currlat;
  double currlon;

  int empid = 0;
  String name = '';
  String email = '';
  String exmpid = '';
  String IMEI = '';

  double startlat=0.0;
  double endlat=0.0;
  double startlng=0.0;
  double endlng=0.0;

  String statusatt="1";

  bool  checkin=true;
  bool  checkout=true;

  TextEditingController LocationController= new TextEditingController();
  TextEditingController CurrentTimeController= new TextEditingController();
  TextEditingController CheckInTimeController= new TextEditingController();
  TextEditingController CheckOutTimeController= new TextEditingController();

  GoogleMapController _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};


  var _kGooglePlex=CameraPosition(target: LatLng(10.937220, 76.991120), zoom: 12);
  Marker marker;
  String destinationaddress;
  String imei;
  int cnt = 0;
  Set<Marker> markers = Set();
  Position position;
  TextEditingController AddressController = new TextEditingController();
  TextEditingController _typeAheadController = new TextEditingController();
  var loading = false;
  bool textcheck = false;
  double radius=1000.0;
  double diff=0.0;

  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor pinLocationIcon1;

  double distance;




  void getLocation() async {
    var location = await currentLocation.getLocation();
    _controller
        ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      target: LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
      zoom: 12.0,
    )));
    final coordinates = new Coordinates(location.latitude, location.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    print(location.latitude);
    print(location.longitude);
    currlat = location.latitude;
    currlon = location.longitude;
    endlat= location.latitude;
    endlng=location.longitude;
    print(first);
    AddressController.text = " ${first.addressLine}";
    print(AddressController);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('Home'),
          position: LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0)));
    });
    // currentLocation.onLocationChanged.listen((LocationData loc) async {
    //
    // });
  }


  @override
  void initState() {

    getLocation();

    CurrentTimeController.text=(DateFormat('dd-MM-yyyy hh:mm-aa  ').format(DateTime.now())).toString();

  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
        body: loading
            ? Center(child: CircularProgressIndicator()):
        SafeArea(
          child: Container(
            color:Color(0xEEEEEEEE),
            child: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.only(
                  // left: 24, right: 24, top: 6, bottom: 6),
                  height: height/8,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xF315619A),
                        Color(0xAD145458),
                      ],
                    ),
                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(0),topLeft:Radius.circular(0) ),
                  ),
                  child:Column(
                    children: [
                      SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5,10, 5),
                            child: Center(child: Text("Attendance",style: TextStyle(color:Color(0xFFFFFFFF),fontWeight: FontWeight.normal ,fontSize: 20,),)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 2,10, 2),
                                child: Text("Location",style: TextStyle(color:Color(0xD0073E6C),fontWeight: FontWeight.normal ,fontSize: 16,),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: TextField(
                                      controller: AddressController,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.fromLTRB(10, 2,10, 2),
                                        hintText: 'Location',
                                        // hintStyle: TextStyle(
                                        //   color: Color(0XFFFFFFFF),
                                        //   fontSize: 16.0,
                                        // ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 2,10, 2),
                                child: Text("Current Date & Time ",style: TextStyle(color:Color(0xD0073E6C),fontWeight: FontWeight.normal ,fontSize: 16,),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: TextField(
                                      controller: CurrentTimeController,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.fromLTRB(10, 2,10, 2),
                                        hintText: 'Current Date & Time',
                                        // hintStyle: TextStyle(
                                        //   color: Color(0XFFFFFFFF),
                                        //   fontSize: 16.0,
                                        // ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height/2.5,
                              width: width,
                              child: GoogleMap(
                                padding: EdgeInsets.only(top: height / 2),
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(10.9356281, 76.9798268),
                                  zoom: 20.0,
                                ),
                                onMapCreated: (GoogleMapController controller) {
                                  _controller = controller;
                                },
                                markers: _markers,
                              ),

                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              if(checkin)
                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: (){
                                      // CheckInTimeController.text=(DateFormat('dd-MM-yyyy hh:mm-aa  ').format(DateTime.now())).toString();
                                      // Navigator.pop(context);

                                      print("Lat"+startlat.toString());
                                      print("Lng"+startlng.toString());

                                    //  distance=getdistance(startlat ,startlng, endlat, endlng);
                                      // distance=getdistance(10.923708 , 76.9812084, endlat, endlng);
                                    },
                                    child: Container(
                                      height: 40,
                                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xED052E4E),
                                              Color(0xC8259AA5),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5))),
                                      child: Center(

                                        child: Text(
                                          'Check-In'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.bold),
                                        ),


                                      ),
                                    ),
                                  ),
                                ),

                              if(checkout)
                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: (){

                                      print("Lat"+startlat.toString());
                                      print("Lng"+startlng.toString());

                                    //  distance=getdistance(startlat ,startlng, endlat, endlng);

                                    },
                                    child: Container(
                                      height: 40,
                                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xED052E4E),
                                              Color(0xC8259AA5),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5))),
                                      child: Center(
                                        child: Text(
                                          'Check-Out'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceReport()));

                            },
                            child: Container(
                              height: 40,
                              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xED052E4E),
                                      Color(0xC8259AA5),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                child: Text(
                                  'Report'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}
