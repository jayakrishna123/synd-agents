import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:async/async.dart';
 
void main()=>runApp(MaterialApp(
home:MainPage(),
));
class MainPage extends StatefulWidget{
@override
MainPageState  createState(){
  return new MainPageState();
}
}
class MainPageState extends State<MainPage>{
 String result="Please Scan Something";
 
 Future _scanQR() async {
   String qrResult = await BarcodeScanner.scan();
   setState(() {
     result=qrResult;
   });
 }
@override
Widget build(BuildContext context){
  return MaterialApp(
    home:DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('synd app'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: Icon(Icons.camera),),
              Tab(child : Icon(Icons.list))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text(result),),
            Center(child: Text("2"),)
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera),
          label: Text("Scan"),
          onPressed: _scanQR,
        ),
 
      )              
    )
  );
  
}
}
 
 
 

