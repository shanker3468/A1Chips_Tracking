
import 'package:flutter/material.dart';

class CustomAlertdialouge extends StatefulWidget {
   CustomAlertdialouge({Key key}) : super(key: key);

  @override
  CustomAlertdialougeState createState() => CustomAlertdialougeState();
}

class CustomAlertdialougeState extends State<CustomAlertdialouge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                    child: Column(
                      children: [
                        Text('Warning !!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 5,),
                        Text('You can not access this file', style: TextStyle(fontSize: 20),),
                        SizedBox(height: 20,),
                        RaisedButton(onPressed: () {
                          Navigator.of(context).pop();
                        },
                          color: Colors.redAccent,
                          child: Text('Okay', style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -60,
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 60,
                      child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                    )
                ),
              ],
            )
        ),
      ),

    );
  }
}
