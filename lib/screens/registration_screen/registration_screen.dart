import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/screens/phone_log_in_screen/phone_log_in_screen.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/img2.jpg'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text("Get your groceries\nwith Nectar",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Center(
                child: Text('Sign in with Phone, Email or Facebook'),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneLogInScreen(),
                        ));
                  },
                  label: Text("Sign In with Phone number"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(330, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.mail),
                  onPressed: () {},
                  label: Text("Sign In with Email"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    fixedSize: const Size(330, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.facebook),
                  onPressed: () {},
                  label: Text("Sign In with Facebook"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent.shade700,
                    fixedSize: const Size(330, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
