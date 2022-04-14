import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.black.withOpacity(0.85),
                      BlendMode.dstATop),
                  image: new NetworkImage(
                    'https://assets.gqindia.com/photos/6070617423780a7fa9a3ec07/master/pass/Online%20grocery%20services.jpeg',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 110,
              left: 55,
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/image/pngcarrot.png"),
                      ),
                      Text('Welcome', style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),),
                      Text('to our store', style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Get Started"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent.shade400,
                            fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}