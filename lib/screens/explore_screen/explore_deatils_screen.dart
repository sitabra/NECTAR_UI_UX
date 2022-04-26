import 'package:flutter/material.dart';

import '../../models/items.dart';

class ExploreDetailsScreen extends StatefulWidget {
  final Items items;
  const ExploreDetailsScreen({Key? key, required this.items}) : super(key: key);

  @override
  State<ExploreDetailsScreen> createState() => _ExploreDetailsScreenState();
}

class _ExploreDetailsScreenState extends State<ExploreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.items.itemsName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(widget.items.itemsImg),
          ),
          Text(widget.items.itemsName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
