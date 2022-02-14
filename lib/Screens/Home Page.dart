
import 'package:a1chips_tracking_1/Screens/DeliveryReports.dart';
import 'package:a1chips_tracking_1/Screens/OrderPicking.dart';
import 'package:a1chips_tracking_1/String_Variable.dart';
import 'package:flutter/material.dart';

import 'CustomAlertDialouge.dart';
import 'maps.dart';

class Dashboard extends StatefulWidget {
 // const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        title:RichText(
          text: TextSpan(
            text: 'a1 ',
            style:TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent,fontStyle:FontStyle.italic,fontSize: 20 ),

            children: const <TextSpan>[
              TextSpan(text: 'chips Riders App', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              //TextSpan(text: ' world!'),
            ],
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
    //  endDrawerEnableOpenDragGesture: false, // THIS WAY IT WILL NOT OPEN
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              duration: Duration(seconds: 2),

              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/logo.png'),
                    maxRadius: 40,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Welcome ${"S.JayaShanker"}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomRight: Radius.circular(100) ),
                color: String_Values.primarycolor,
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.home,
                color: String_Values.primarycolor,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                      (Route<dynamic> route) => false,
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: String_Values.primarycolor,
              ),
              title: Text('Shop By Category'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CategoriesPage()),
                //
                // );
                // Update the state of the app.
                // ...
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.local_offer,
            //     color: String_Values.primarycolor,
            //   ),
            //   title: Text("Today's Deal"),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.bookmarks,
                color: String_Values.primarycolor,
              ),
              title: Text("My Orders"),
              onTap: () {

              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrders()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: String_Values.primarycolor,
              ),
              title: Text("My Address"),
              onTap: () {
                // Update the state of the app.
                // ...

             //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: String_Values.primarycolor,
              ),
              title: Text("My Cart"),
              onTap: () {
                // Update the state of the app.
                // ...
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrders()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: String_Values.primarycolor,
              ),
              title: Text("My Notifications"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                //       (Route<dynamic> route) => false,
                // ); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

            ExpansionTile(
              title: Text("Contact Us"),
              children: [
                ListTile(
                  title:  Row(
                    children: [

                      Container(
                        width: width/3,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  String_Values.primarycolor,
                                  Colors.deepOrangeAccent.withOpacity(0.5),
                                  Colors.deepOrangeAccent.withOpacity(0.5),
                                  String_Values.primarycolor,

                                ]
                            )
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'a1 ',
                            style:TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent,fontStyle:FontStyle.italic,fontSize: 20 ),

                            children: const <TextSpan>[
                              TextSpan(text: 'chips', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                              //TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  trailing:Text("9750564825"),
                  onTap: () {

                  },
                ),


              ],

            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: SafeArea(
            child: Container(
              color: Colors.white70,
              height: height,
              width: width,
              child: Stack(
                children: [
                  Container(
                      height: height / 3.8,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)))),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.all(16.0),
                        //         child: Center(
                        //           child: Text(
                        //             "Dashboard",
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 20),
                        //           ),
                        //         ),
                        //       ),
                        //       IconButton(
                        //           icon: Icon(
                        //             Icons.logout,
                        //             color: Colors.white,
                        //           ),
                        //           onPressed: () {
                        //             // removeValue();
                        //
                        //           }),
                        //     ],
                        //   ),
                        //   color: Colors.red,
                        // ),
                        SizedBox(
                          height: height / 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                String_Values.primarycolor,
                                Colors.deepOrangeAccent.withOpacity(0.5),
                                Colors.deepOrangeAccent.withOpacity(0.5),
                                String_Values.primarycolor,
                              ],
                            ),
                            // borderRadius: BorderRadius.all(Radius.circular(width)),
                          ),
                          width: width,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Stack(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        text: 'a1 ',
                                        style:TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent,fontStyle:FontStyle.italic,fontSize: 30 ),

                                        children: const <TextSpan>[
                                          TextSpan(text: 'chips', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
                                          //TextSpan(text: ' world!'),
                                        ],
                                      ),
                                    ),

                                    // Stroked text as border.
                                    // Text(
                                    //   'A1 chips',
                                    //   style: TextStyle(
                                    //     fontStyle: FontStyle.italic,
                                    //     fontSize: 30,
                                    //     foreground: Paint()
                                    //       ..style = PaintingStyle.stroke
                                    //       ..strokeWidth = 4
                                    //       ..color = Colors.black,
                                    //   ),
                                    // ),
                                    // // Solid text as fill.
                                    // Text(
                                    //   'A1 chips',
                                    //   style: TextStyle(
                                    //     fontStyle: FontStyle.italic,
                                    //     fontSize: 30,
                                    //     color: Colors.red,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              // Image.asset(
                              //   "logo.png",
                              //   height: height / 9,
                              //   width: width / 1.5,
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: height - height / 3,
                            width: width,
                            child: GridView.count(
                              crossAxisSpacing: width / 40,
                              mainAxisSpacing: height / 60,
                              crossAxisCount: 2,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPicking()));
                                    print("Clicked");
                                  },
                                  child: GestureDetector(

                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        elevation: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/RidersTrack.png',
                                                height: height / 7,
                                                width: double.infinity),
                                            SizedBox(
                                              height: height / 40,
                                            ),
                                            Container(
                                                padding: EdgeInsets.all(3),
                                                width: double.infinity,
                                                color: Colors.red,
                                                child: Center(
                                                  child:

                                                  Text(
                                                    "Riders Orders",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),

                                                ))
                                          ],
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Myattendance()));
                                  },
                                  child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/clock_history.png',
                                              height: height / 7,
                                              width: double.infinity),
                                          SizedBox(
                                            height: height / 40,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(3),
                                              width: double.infinity,
                                              color: Colors.teal,
                                              child: Center(
                                                child: Text(
                                                  "Order History ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                        ],
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryReports()));
                                  },

                                  child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/reports.png',
                                              height: height / 7,
                                              width: double.infinity),
                                          SizedBox(
                                            height: height / 40,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(3),
                                              width: double.infinity,
                                              color: Colors.red,
                                              child: Center(
                                                child: Text(
                                                  "Delivery Reports",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                        ],
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomAlertdialouge()));
                                  },

                                  child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/reports.png',
                                              height: height / 7,
                                              width: double.infinity),
                                          SizedBox(
                                            height: height / 40,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(3),
                                              width: double.infinity,
                                              color: Colors.red,
                                              child: Center(
                                                child: Text(
                                                  " Reports",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
