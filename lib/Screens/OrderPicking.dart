
import 'dart:developer';

import 'package:a1chips_tracking_1/Screens/OrderPickingDetailScreen.dart';
import 'package:a1chips_tracking_1/String_Variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:url_launcher/url_launcher.dart';

class OrderPicking extends StatefulWidget {
   OrderPicking({Key key}) : super(key: key);

  @override
  OrderPickingState createState() => OrderPickingState();
}

class OrderPickingState extends State<OrderPicking> {

  List<double> timeDilation1= new List();
   List<OrderPickingModel> li2;


  @override
  void initState() {
    li2 = <OrderPickingModel>[];
    li2.add(OrderPickingModel(1, "Sundrapuram", "Bala","9750564633","2/128 sundrapuram" ,"Online","280"),);
    li2.add(OrderPickingModel(2, "Chettipalayam", "Raj","9750564633","2/18 Chettipalayam" ,"Online","240"),);
    li2.add(OrderPickingModel(3, "Podanur", "Shanker","9750564633","4/128 Podanur" ,"Online","180"),);
    li2.add(OrderPickingModel(4, "sulur", "Vignesh","9750564633","2/128 sulur" ,"Online","480"),);
    li2.add(OrderPickingModel(5, "Vellore", "Gowtham","8760564633","2/128 Vellore" ,"Online","480"),);

   for(int i=0;i<li2.length;i++){
     print(li2[i].CustomerName);
   }
    log(li2.length.toString());
  }

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
              TextSpan(text: 'Chips Order Picking', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
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

      body:SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Container(
                height:height,
                width: width,
                color: Colors.red.withOpacity(0.2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "All Orders",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "View All   >",
                            style: TextStyle(
                                fontSize: 16,
                                color: String_Values.primarycolor,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 16,
                        right: 16,
                      ),
                      height: AppBar().preferredSize.height - 10,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(
                              color: String_Values.primarycolor,
                              width: 1),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                      child: new TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 20.0,
                          ),
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height:height/1.5,
                            color: Colors.red.shade100,
                            child: ListView.builder(

                              itemBuilder: (context, i) {
                                return InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderPickingDetailScreen(DocNo:li2[i].OrderNo)
                                      ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        shadowColor:Colors.red.shade100,
                                        elevation: 20,
                                        child: Column(
                                            children: [

                                        CheckboxListTile(
                                        title: const Text('Do you want To Pick',style:
                                          TextStyle(color:Colors.red,fontSize:15,fontWeight:FontWeight.bold),),
                                        value: timeDilation != 1.0,
                                        onChanged: (bool value) {
                                          setState(() {
                                            timeDilation = value ? 1.5 : 1.0;
                                          });
                                        },
                                        secondary: IconButton(
                                          icon: new Icon(
                                            Icons.find_in_page_outlined,
                                            color: Colors.red.shade800,
                                          ),
                                          highlightColor: Colors.pink,
                                          onPressed: () {

                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                MediaQuery.of(context).orientation;
                                                return AlertDialog(
                                                  title: Text("Details"),
                                                  content: SingleChildScrollView(
                                                    scrollDirection: Axis.vertical,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Container(
                                                            //width: double.infinity,
                                                            color: Colors.white,
                                                            padding: EdgeInsets.all(0),
                                                            margin: EdgeInsets.all(1),
                                                            child: Column(
                                                              // mainAxisAlignment:
                                                              //     MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Order No',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child: Text(li2[i].OrderNo.toString())),

                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Cus Name',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child: Text(li2[i].DeliverPlace)),

                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Phone Number',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child: Text(li2[i].PhoneNumber)),

                                                                  ],),
                                                                SizedBox(height: 5,),

                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Address',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child: Text(li2[i].Address),

                                                                    )],),
                                                                SizedBox(height: 5,),

                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Order Details',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child: Text(""
                                                                      // li8[i].invoicedate.substring(6,8)+'-'+li8[i].invoicedate.substring(4,6)+'-'+li8[i].invoicedate.substring(0,4)
                                                                    )),

                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),

                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Payment Type',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child: Text(li2[i].PaymentType
                                                                      // li8[i].postingdate.substring(6,8)+'-'+li8[i].postingdate.substring(4,6)+'-'+li8[i].postingdate.substring(0,4)
                                                                    )),

                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),

                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text('Amount',
                                                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(':',
                                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                                    ),
                                                                    Expanded(flex: 3,child:



                                                                    Text(li2[i].Amount
                                                                      // li8[i].Currency.toString()=="INR"? "Rs."+double.parse(li8[i].amount).round().toString(): "Doller ."+double.parse(li8[i].amount).round().toString(),style: TextStyle(fontWeight: FontWeight.bold)
                                                                    )),

                                                                  ],
                                                                ),

                                                                SizedBox(height: 5,),
                                                            Row(
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
                                                            ),
                                                                SizedBox(height: 5,),

                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                          },
                                        ),
                                      ),

                                              ListTile(
                                                title: Text('Order No',
                                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                                trailing: Text(li2[i].OrderNo.toString()),

                                              ),
                                              ListTile(
                                                title: Text('Delivery Place',
                                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                                trailing: Text(li2[i].DeliverPlace),

                                              ),
                                              ListTile(
                                                title: Text('Customer Name',
                                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                                trailing: Text(li2[i].
                                                CustomerName),
                                              ),
                                              ListTile(
                                                title: Text(li2[i].PhoneNumber),
                                                leading: Text('Phone Number',
                                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                                trailing: InkWell(
                                                  onTap:() async {
                                                    var url='tel:${li2[i].PhoneNumber}';


                                                    await launch(url);

                                                  },
                                                    child: Icon(Icons.call,color:Colors.green,)),
                                              ),

                                            ]

                                        ),
                                      ),
                                    ));
                              },
                              itemCount: li2.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            )

          ],
        ),
      )


    );
  }
}

class OrderPickingModel {
  var OrderNo;
  var DeliverPlace;
  var CustomerName;
  var PhoneNumber;
  var Address;
  var PaymentType;
  var Amount;


  OrderPickingModel(this.OrderNo, this.DeliverPlace, this.CustomerName, this.PhoneNumber
      ,this.Address,this.PaymentType,this.Amount);
}
