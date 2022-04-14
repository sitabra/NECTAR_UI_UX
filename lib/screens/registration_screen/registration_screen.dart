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
      body: Column(
        children: [
          Container(
            // color: Colors.green,
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://media.istockphoto.com/photos/fresh-raw-vegetable-variation-in-a-paper-shopping-bag-on-a-white-top-picture-id1226363446?k=20&m=1226363446&s=170667a&w=0&h=JhB9PfRjrcmnRGDcayoc2ZaSGOX-091ACcnIl3COtCE="),
                fit: BoxFit.cover,
              )
            ),
          )
        ],
      ),
    );
  }
}
