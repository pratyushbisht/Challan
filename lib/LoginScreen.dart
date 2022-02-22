import 'package:challan/OTP.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = '+00';
   TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           SizedBox(height: 70,),

            Padding(
              padding: const EdgeInsets.only(left: 28,right: 28),
              child: Image.asset('images/login.jpg'),

            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(top:10),
              child: Center(
                child: Text(
                  "Phone OTP",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: 400,
              height: 60,
              child: CountryCodePicker(
                onChanged: (country){
                  setState(() {
                    dialCodeDigits = country.dialCode!;
                  });
                },
                initialSelection: 'ID',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: ['+91','ID'],

              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10,right: 10,left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff005CB4))),
                  prefix: Padding(padding: EdgeInsets.all(4),child: Text(dialCodeDigits),),

                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffC9002B))),


                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: controller,
              ),
            ),

            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => OTPcontrollerScreen(
                    phone: controller.text,
                    codeDigits: dialCodeDigits,


                  ) ));

                },
                child: Text('Send OTP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),


            )


          ],

        ),


      ),

    );
  }
}
