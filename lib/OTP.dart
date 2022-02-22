import 'package:challan/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_core/firebase_core.dart';


class OTPcontrollerScreen extends StatefulWidget {
 late final String phone;
 late final String codeDigits;

 OTPcontrollerScreen( {required this.phone, required  this.codeDigits});


  @override
  _OTPcontrollerScreenState createState() => _OTPcontrollerScreenState();
}

class _OTPcontrollerScreenState extends State<OTPcontrollerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pintOTPcontroller = TextEditingController();
  final FocusNode _pinOTPcodeFocus = FocusNode();
  late String verification;

  final BoxDecoration pinOTPbox = BoxDecoration(
    color: Color(0xff005CB4),
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.grey),

  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();

    verifyPhoneNumber();
  }

  verifyPhoneNumber()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential).then((value){
          if (value.user != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (
                c) => HomeScreen(phone: " ${widget.codeDigits} + ${widget.phone}",)));
          }
        });
      },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid OTP"),duration: Duration(seconds: 3)));
          },
          codeSent: (String vID, int? resendToken){
        setState(() {
          verification = vID;
        });

                },
      codeAutoRetrievalTimeout: (String vID){
        setState(() {
          verification = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/otp.png'),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
                alignment: Alignment.center,
                child: Text("An OTP is sent to ${widget.codeDigits} ${widget.phone}",style: TextStyle(color: Color(0xff004B93),fontSize: 25,fontWeight: FontWeight.bold),)),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.all(20),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen(
                    phone: " ${widget.codeDigits}  ${widget.phone}",
                  )));
                },
              child: Text("Verifying",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(fontSize: 25,color: Colors.white),
              eachFieldHeight: 40,
              eachFieldWidth: 55,
              focusNode: _pinOTPcodeFocus,
              controller: _pintOTPcontroller,
              submittedFieldDecoration: pinOTPbox,
              selectedFieldDecoration: pinOTPbox,
              followingFieldDecoration: pinOTPbox,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async{
                try {
                  await FirebaseAuth.instance.
                  signInWithCredential
                    (PhoneAuthProvider.credential(
                      verificationId: verification,
                      smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (
                          c) => HomeScreen(phone: " ${widget.codeDigits}  ${widget.phone}",)));
                    }
                  });
                }
                        catch(e){
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid OTP"),duration: Duration(seconds: 3)));


                }

              },
            ),
          )



        ],
      ),

    );
  }
}
