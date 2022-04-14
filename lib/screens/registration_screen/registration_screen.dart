import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Container(
            // color: Colors.green,
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://t3.ftcdn.net/jpg/02/46/02/78/360_F_246027822_NwEoRdOEJZ9K62jkO0Stk39yDAt919hE.jpg"),
                fit: BoxFit.cover,
              )
            ),
          )
        ],
      ),
    );
  }
}
