
import 'package:a1chips_tracking_1/String_Variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_charts/charts.dart';





class OrderPickingDetailScreen extends StatefulWidget {
   OrderPickingDetailScreen({Key key , this.DocNo}) : super(key: key);


   var DocNo;




  @override
  OrderPickingDetailScreenState createState() => OrderPickingDetailScreenState();


}

class OrderPickingDetailScreenState extends State<OrderPickingDetailScreen> {

  double currlat;
  double currlon;

  double startlat=0.0;
  double endlat=0.0;
  double startlng=0.0;
  double endlng=0.0;
  TextEditingController AddressController = new TextEditingController();
  TextEditingController CurrentTimeController= new TextEditingController();



  bool loading= false;
  GoogleMapController _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};


  var _kGooglePlex=CameraPosition(target: LatLng(10.937220, 76.991120), zoom: 12);
  Marker marker;
  Set<Marker> markers = Set();
  Position position;


  void getLocation() async {
    setState(() {
      loading = true;
    });
    var location = await currentLocation.getLocation();

    _controller
        ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      target: LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
      zoom: 4000,
    )));
    final coordinates = new Coordinates(location.latitude, location.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      loading=false;
    });

    print("${first.featureName} : ${first.addressLine}");
    print(location.latitude);
    print(location.longitude);
    currlat = location.latitude;
    currlon = location.longitude;
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
    setState(() {
      loading = false;
    });
  }









  @override
  void initState() {

    getLocation();





  }



  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        title:Center(
          child: RichText(
            text: TextSpan(
              text: 'Order No -',
              style:TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent,fontStyle:FontStyle.italic,fontSize: 20 ),

              children: <TextSpan>[
                TextSpan(text:widget.DocNo.toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                //TextSpan(text: ' world!'),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ),

        ],




      ),
      bottomSheet:
      Container(
        color:Colors.red.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomSheet(
            backgroundColor: Colors.red.withOpacity(0.2),

            builder: (BuildContext context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 5,

                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(178, 45, 48, .9),
                                Color.fromRGBO(178, 45, 48, 1),
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Pick'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            )

                          ],
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(178, 45, 48, .9),
                                Color.fromRGBO(178, 45, 48, 1),
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Cancel'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            onClosing: () {},
          ),
        ),
      ),

      body:SingleChildScrollView(
        child: Column(

          children: [

            Container(
              height:height,
              width: width,
              child: GoogleMap(
                padding: EdgeInsets.only(top: height),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(currlat, currlon),
                  zoom: 20.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                markers: _markers,
              ),
            ),

          ],
        ),
      ),


      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              backgroundColor:Colors.transparent,
                context: context, builder: (BuildContext context) {
              return Container(
                height: height/2,
                width: width,
                color:Colors.white.withOpacity(0.8),
                child: Column(
                  // mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),

                    Container(
                      height: height/5,
                      child: Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Icon(CupertinoIcons.asterisk_circle_fill,color: Colors.red,size: 15,),
                                Expanded(flex:1,child:Container(
                                  color: Colors.red,
                                  height: double.infinity,
                                  width: 2,
                                ))
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Picking Point ',
                                    style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16 ),

                                    children: <TextSpan>[
                                      TextSpan(text: 'Sat, 21st 11.00AM', style: TextStyle(color: Colors.grey.shade600,fontSize: 12 )),
                                      //TextSpan(text: ' world!'),
                                    ],
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text("Sundarapuram A1 Ships -Branch 1"),
                                      Text('Sat, 21st 11.00AM')
                                    ]
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    Container(
                      height: height/5,
                      child: Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Icon(CupertinoIcons.asterisk_circle_fill,color: Colors.green,size: 15,),
                                // Expanded(flex:1,child:Container(
                                //   color: Colors.green,
                                //   height: double.infinity,
                                //   width: 2,
                                // ))
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Delivery Point ',
                                    style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16 ),

                                    children: <TextSpan>[
                                      TextSpan(text: 'Sat, 21st 11.30Am', style: TextStyle(color: Colors.grey.shade600,fontSize: 12 )),
                                      //TextSpan(text: ' world!'),
                                    ],
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text("2/15 Sathish, Ram nagar,Sundarapuram"),
                                      Text('Sat, 21st 11:30 AM')
                                    ]
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),

                  ],
                ),
              );
            } );
          },
          backgroundColor:Colors.red.shade800,
          tooltip: 'Increment',
          child: const Icon(Icons.file_copy_outlined),
        ),
      ),

    );
  }
}
