import 'package:challan/LoginScreen.dart';
import 'package:challan/challan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:challan/LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  late final String phone;


  HomeScreen( {required this.phone, });
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Challan(phone: "${widget.phone}",)));

              },
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("1.0 \n Vendor Challan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              ),

            ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2.0 \nCreate PPR \n(Source)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                ),

              )
            ],),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("3.0 \n Create PPR\n(Destination)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                ),

              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("4.0 \n Reports",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                ),

              )
            ],),
          Container(
            margin: EdgeInsets.all(65),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginScreen()));

              },
              child: Text("LogOut",style: TextStyle(color: Colors.white,fontSize: 16),) ,
            ),

          )
        ],
      ),


    );
  }
}
