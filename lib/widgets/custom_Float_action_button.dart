import 'package:flutter/material.dart';

class CustomFloatActionButton extends StatefulWidget {
  const CustomFloatActionButton({Key? key}) : super(key: key);

  @override
  State<CustomFloatActionButton> createState() => _CustomFloatActionButtonState();
}

class _CustomFloatActionButtonState extends State<CustomFloatActionButton> {

  final double elevation = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: elevation,
      backgroundColor: Colors.green,
      mini: true,
      onPressed: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      child: Icon(Icons.add),
    );
  }
}
