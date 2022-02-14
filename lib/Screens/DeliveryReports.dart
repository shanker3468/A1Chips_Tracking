
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryReports extends StatefulWidget {
   DeliveryReports({Key key}) : super(key: key);



  @override
  DeliveryReportsState createState() => DeliveryReportsState();
}

class DeliveryReportsState extends State<DeliveryReports> {

  List<OrderPickingModel> li2;



  bool loading=false;

  TextEditingController Searchcontroller = new TextEditingController();

  String totalcount="";
  @override




  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:AppBar(
          bottom: TabBar(
            indicatorWeight: 2,
            isScrollable: false,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.yellow.shade700,
            onTap: (tabindex) {
              setState(() {
                if (tabindex == 0) {
                  // persistentButvisible = true;
                } else {
                  //persistentButvisible = false;
                }
                if (tabindex == 1) {
                  //  ConsumptionButtonPersistent = true;
                } else {
                  // ConsumptionButtonPersistent = false;
                }
              });
            },
            tabs: [
              Tab(
                text: 'Deliverd', // label of the Tab
                iconMargin: EdgeInsets.only(bottom: 10.0), // default margin
              ),
              Tab(
                text: 'Pending', // label of the Tab
                iconMargin: EdgeInsets.only(bottom: 10.0), // default margin
              ),
              Tab(
                text: 'Cancelled', // label of the Tab
                iconMargin: EdgeInsets.only(bottom: 10.0), // default margin
              ),
            ],
          ),
          title:Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  text: 'a1 ',
                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent,fontStyle:FontStyle.italic,fontSize: 20 ),

                  children: const <TextSpan>[
                    TextSpan(text: 'Chips Delivery Reports', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                    //TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ],
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
        body: loading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: height,
                width: width,
                color:Colors.red.withOpacity(0.2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //  SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text( "Delivered List count ="+
                            totalcount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: Searchcontroller,
                            decoration: InputDecoration(
                              hintText: 'Search Here',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.redAccent, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 2.0),
                              ),
                            ),
                            onChanged: (vvv) {

                            }),
                      ),

                      SingleChildScrollView(


                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 50, left: 15, right: 15),
                          child: DataTable(
                            // onSelectAll: n,
                            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.red.shade700),
                            columnSpacing: 15,

                            columns: [
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "S.No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "History",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Order No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Customer Name",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Delivery Place",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Payment Type",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Amount",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                            ],

                            rows: li2
                                .map(
                                  (list) => DataRow(

                                  color:MaterialStateColor.resolveWith((states) =>  Colors.white),


                                  cells: [
                                    DataCell(Center(
                                        child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [

                                                Text( (li2.indexOf(list)+
                                                    1)
                                                    .toString(),
                                                    textAlign: TextAlign.center)
                                              ]),
                                        ))),
                                    DataCell(

                                        Center(
                                            child: Center(
                                              child: Wrap(
                                                  direction: Axis.vertical, //default
                                                  alignment: WrapAlignment.center,
                                                  children: [

                                                    Icon(Icons.history_outlined,color: Colors.red,)
                                                  ]),
                                            )),onTap: (){
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
                                                              Expanded(flex: 3,child: Text(list.OrderNo.toString())),

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
                                                              Expanded(flex: 3,child: Text(list.Deliveryplace)),

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
                                                              Expanded(flex: 3,child: Text(list.PhoneNumber)),

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
                                                              Expanded(flex: 3,child: Text(list.Address),

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
                                                              Expanded(flex: 3,child: Text(list.PaymentType
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



                                                              Text(list.Amount
                                                                // li8[i].Currency.toString()=="INR"? "Rs."+double.parse(li8[i].amount).round().toString(): "Doller ."+double.parse(li8[i].amount).round().toString(),style: TextStyle(fontWeight: FontWeight.bold)
                                                              )),

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


                                    }),
                                    DataCell(Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [

                                          Text(list.OrderNo),

                                        ])),


                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.CustomerName,

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.Deliveryplace,

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.PaymentType.toString(),

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.Amount.toString(),

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),


                                  ]),
                            )
                                .toList(),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                color:Colors.red.withOpacity(0.2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //  SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text( "pending List count ="+
                            totalcount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: Searchcontroller,
                            decoration: InputDecoration(
                              hintText: 'Search Here',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.redAccent, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 2.0),
                              ),
                            ),
                            onChanged: (vvv) {

                            }),
                      ),

                      SingleChildScrollView(


                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 50, left: 15, right: 15),
                          child: DataTable(
                            // onSelectAll: n,
                            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.red.shade700),
                            columnSpacing: 15,

                            columns: [
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "S.No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "History",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Order No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Customer Name",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Delivery Place",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Payment Type",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Amount",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                            ],

                            rows: li2
                                .map(
                                  (list) => DataRow(

                                  color:MaterialStateColor.resolveWith((states) =>  Colors.white),


                                  cells: [
                                    DataCell(Center(
                                        child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [

                                                Text( (li2.indexOf(list)+
                                                    1)
                                                    .toString(),
                                                    textAlign: TextAlign.center)
                                              ]),
                                        ))),
                                    DataCell(

                                        Center(
                                            child: Center(
                                              child: Wrap(
                                                  direction: Axis.vertical, //default
                                                  alignment: WrapAlignment.center,
                                                  children: [

                                                    Icon(Icons.history_outlined,color: Colors.red,)
                                                  ]),
                                            )),onTap: (){
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
                                                              Expanded(flex: 3,child: Text(list.OrderNo.toString())),

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
                                                              Expanded(flex: 3,child: Text(list.Deliveryplace)),

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
                                                              Expanded(flex: 3,child: Text(list.PhoneNumber)),

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
                                                              Expanded(flex: 3,child: Text(list.Address),

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
                                                              Expanded(flex: 3,child: Text(list.PaymentType
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



                                                              Text(list.Amount
                                                                // li8[i].Currency.toString()=="INR"? "Rs."+double.parse(li8[i].amount).round().toString(): "Doller ."+double.parse(li8[i].amount).round().toString(),style: TextStyle(fontWeight: FontWeight.bold)
                                                              )),

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


                                    }),
                                    DataCell(Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [

                                          Text(list.OrderNo),

                                        ])),


                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.CustomerName,

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.Deliveryplace,

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.PaymentType.toString(),

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.Amount.toString(),

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),


                                  ]),
                            )
                                .toList(),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                color:Colors.red.withOpacity(0.2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //  SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text( "Cenceled List count ="+
                            totalcount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: Searchcontroller,
                            decoration: InputDecoration(
                              hintText: 'Search Here',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.redAccent, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 2.0),
                              ),
                            ),
                            onChanged: (vvv) {

                            }),
                      ),

                      SingleChildScrollView(


                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 50, left: 15, right: 15),
                          child: DataTable(
                            // onSelectAll: n,
                            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.red.shade700),
                            columnSpacing: 15,

                            columns: [
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "S.No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "History",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Order No",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Customer Name",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Delivery Place",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Payment Type",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),
                              DataColumn(
                                label: Center(
                                    child: Wrap(
                                      direction: Axis.vertical, //default
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          "Amount",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                numeric: false,

                                // onSort: (columnIndex, ascending) {
                                //   onSortColum(columnIndex, ascending);
                                //   setState(() {
                                //     sort = !sort;
                                //   });
                                // }
                              ),

                            ],

                            rows: li2
                                .map(
                                  (list) => DataRow(

                                  color:MaterialStateColor.resolveWith((states) =>  Colors.white),


                                  cells: [
                                    DataCell(Center(
                                        child: Center(
                                          child: Wrap(
                                              direction: Axis.vertical, //default
                                              alignment: WrapAlignment.center,
                                              children: [

                                                Text( (li2.indexOf(list)+
                                                    1)
                                                    .toString(),
                                                    textAlign: TextAlign.center)
                                              ]),
                                        ))),
                                    DataCell(

                                        Center(
                                            child: Center(
                                              child: Wrap(
                                                  direction: Axis.vertical, //default
                                                  alignment: WrapAlignment.center,
                                                  children: [

                                                    Icon(Icons.history_outlined,color: Colors.red,)
                                                  ]),
                                            )),onTap: (){
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
                                                              Expanded(flex: 3,child: Text(list.OrderNo.toString())),

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
                                                              Expanded(flex: 3,child: Text(list.Deliveryplace)),

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
                                                              Expanded(flex: 3,child: Text(list.PhoneNumber)),

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
                                                              Expanded(flex: 3,child: Text(list.Address),

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
                                                              Expanded(flex: 3,child: Text(list.PaymentType
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



                                                              Text(list.Amount
                                                                // li8[i].Currency.toString()=="INR"? "Rs."+double.parse(li8[i].amount).round().toString(): "Doller ."+double.parse(li8[i].amount).round().toString(),style: TextStyle(fontWeight: FontWeight.bold)
                                                              )),

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


                                    }),
                                    DataCell(Wrap(
                                        direction: Axis.vertical, //default
                                        alignment: WrapAlignment.center,
                                        children: [

                                          Text(list.OrderNo),

                                        ])),


                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.CustomerName,

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.Deliveryplace,

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.PaymentType.toString(),

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),
                                    DataCell(
                                      Wrap(
                                          direction: Axis.vertical, //default
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(list.Amount.toString(),

                                                textAlign: TextAlign.start)
                                          ]),
                                    ),


                                  ]),
                            )
                                .toList(),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor:Colors.red.shade800,
          tooltip: 'Increment',
          child: const Icon(Icons.arrow_back),
        ),
          ),
    );
  }

  @override
  void initState() {
    li2 = <OrderPickingModel>[];
    li2.add(OrderPickingModel(1,"1001","09-02-2022", "Sundrapuram", "Bala","9750564633","2/128 sundrapuram" ,"Online","280"),);
    li2.add(OrderPickingModel(2,"1002","06-02-2022", "Chettipalayam", "Raj","9750564633","2/18 Chettipalayam" ,"Online","240"),);
    li2.add(OrderPickingModel(3,"1003","04-02-2022" ,"Podanur", "Shanker","9750564633","4/128 Podanur" ,"Online","180"),);
    li2.add(OrderPickingModel(4,"1004","02-02-2022", "sulur", "Vignesh","9750564633","2/128 sulur" ,"Online","480"),);
    li2.add(OrderPickingModel(5,"1005","01-02-2022", "Vellore", "Gowtham","8760564633","2/128 Vellore" ,"Online","480"),);

    for(int i=0;i<li2.length;i++){
      print(li2[i].CustomerName);
    }
    log(li2.length.toString());
  }
}


class OrderPickingModel {
  var Sno;
  var OrderNo;
  var OrderDate;
  var Deliveryplace;
  var CustomerName;
  var PhoneNumber;
  var Address;
  var PaymentType;
  var Amount;


  OrderPickingModel(this.Sno, this.OrderNo, this.OrderDate,this.Deliveryplace,this.CustomerName, this.PhoneNumber
      ,this.Address,this.PaymentType,this.Amount);
}
