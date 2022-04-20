import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:nectar_ui_ux/screens/registration_screen/registration_screen.dart';
import 'package:nectar_ui_ux/screens/shop_screen/shop_screen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class PhoneLogInScreen extends StatefulWidget {
  const PhoneLogInScreen({Key? key}) : super(key: key);

  @override
  State<PhoneLogInScreen> createState() => _PhoneLogInScreenState();
}

class _PhoneLogInScreenState extends State<PhoneLogInScreen> {

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();


  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {

    setState(() {
      showLoading = true;
    });

    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if(authCredential?.user != null){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavigationScreen(),
            ));
      }

    } on FirebaseAuthException catch (e) {

      setState(() {
        showLoading = false;
      });

      //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text("Enter your mobile number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CountryCodePicker(
                  initialSelection: 'IN',
                  showCountryOnly: false,
                  showFlag: true,
                  showFlagDialog: true,
                  showFlagMain: true,
                  favorite: ['+91','IN'],
                  alignLeft: true,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(
                Icons.arrow_forward_ios_outlined),
            onPressed: () async {

              setState(() {
                showLoading =  true;
              });

             await _auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                    //signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      showLoading = false;
                    });
                    // _scaffoldKey.currentState?.showSnackBar(SnackBar(
                    //     content: Text(verificationFailed.message)));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {

                  },
              );
            },

          )
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Enter your 6-digit code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: "Enter OTP",
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(
                  Icons.arrow_forward_ios_outlined),
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
                signInWithPhoneAuthCredential(phoneAuthCredential);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigationScreen(),
                    ));
              })
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),);
          },
        ),
      ),
      body: Container(
        child: showLoading ? Center(child: CircularProgressIndicator(),) : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE ?
        getMobileFormWidget(context) :
        getOtpFormWidget(context),
      ),
    );
  }
}

