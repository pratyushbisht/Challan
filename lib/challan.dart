import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challan/OTP.dart';
import 'package:challan/LoginScreen.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Challan extends StatefulWidget {
  late String phone;



  Challan({required this.phone});
  @override
  _ChallanState createState() => _ChallanState();
}

class _ChallanState extends State<Challan> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  GlobalKey<SfSignaturePadState> _signaturePadKey1 = GlobalKey();
  late String terrain;
  late String destination;
  late String truckN;
  late String LRnumber;
   int gross = 0;
   int net = 0;
   int ter=0;


  String? dropDownvalue = "Select";
  String? dropVal = "Select";
  var items = ["Select","Ossom Foods Pvt ltd","ABC Foods pvt limited"];
  var potatoe = ["Select","Yukon Gold Potato","Bintje","kennebec potato "];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Challan details"),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: Text("Enter the \nChallan Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Vendor:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black54))
                      ),
                        value: dropDownvalue,
                        icon: Icon(Icons.arrow_drop_down_sharp),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(items));
                        }).toList(),
                      onChanged: (String? newValue){
                          setState(() {
                            dropDownvalue = newValue;
                          });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("Phone Number:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                  child:Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("${widget.phone}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                  ),
                  ),
                ]
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Terrain:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Terrain",
                        hintText: "Terrain",
                      ),
                      onChanged: (text){
                        terrain = text;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Potato Type:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black54))
                      ),
                      value: dropVal,
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      items: potatoe.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items)

                            );

                      }).toList(),
                      onChanged: (String? newVal){
                        setState(() {
                          dropVal = newVal;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Terrain:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Destination",
                        hintText: "Where are you delivering",
                      ),
                      onChanged: (text){
                        destination = text;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Net Weight:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Net Weight",
                        hintText: "Enter Net Weight",
                      ),
                      onChanged: (text){
                        net = int.parse(text);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gross Weight:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),

                  Expanded(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Gross Weight",
                            hintText: "Enter Gross Weight",
                          ),
                          onChanged: (text){
                            gross = int.parse(text);
                            print(gross);
                            print(net);

                            setState(() {

                              print(ter);
                            });
                          },
                        ),
                        SizedBox(height: 5,),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            ter = net - gross;
                          });
                        }, child: Text("Calculate Ter.Weight")),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
              // ElevatedButton(onPressed: (){
              //   setState(() {
              //     ter = net - gross;
              //   });
              // }, child: Text("Calculate Ter.Weight")),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Ter Weight:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  SizedBox(width: 20,),
                  Expanded(
                    child:Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("$ter")
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Truck Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Truck Number",
                        labelText: "Truck Number",
                      ),
                      onChanged: (text){
                        text = truckN;
                      },

                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("LR Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter LR Number",
                        labelText: "LR Number",
                      ),
                      onChanged: (text){
                        text = LRnumber;
                      },

                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Vendor Signature:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(height: 20,),

                     Column(
                       children: [
                         Container(
                          child: SfSignaturePad(
                            key: _signaturePadKey,
                            backgroundColor: Colors.grey[200],
                          ),
                          height: 200,
                    ),
                         SizedBox(height: 20,),
                         SizedBox(
                           height: 30,
                           width: 100,
                           child: ElevatedButton(
                               child: Text("Clear"),
                               onPressed: () async {
                                  _signaturePadKey.currentState!.clear();
                               }),
                         ),
                       ],
                     ),
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("Driver's Signature",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                          SizedBox(height: 20,),
                          Container(
                            child: SfSignaturePad(
                              key: _signaturePadKey1,
                              backgroundColor: Colors.grey[200],
                            ),
                            height: 200,
                          ),
                          SizedBox(height: 10,),
                          SizedBox(height:30,width: 100,child: ElevatedButton(onPressed: () async{_signaturePadKey1.currentState!.clear();}, child: Text("Clear"))),
                        ],
                      ),
                      SizedBox(height: 30,),

                    ],
                  )

                ],
              )
            ],
          ),





          ),
        ),


      );

  }
}
