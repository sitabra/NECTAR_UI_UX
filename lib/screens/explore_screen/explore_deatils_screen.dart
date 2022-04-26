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
      body: Center(
        child: Text(widget.items.itemsName),
      ),
    );
  }
}
