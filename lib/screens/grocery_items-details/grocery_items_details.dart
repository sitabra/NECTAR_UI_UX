import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/models/category.dart';
class GroceryItemsDetails extends StatefulWidget {
  final Category category;
  const GroceryItemsDetails({Key? key, required this.category}) : super(key: key);

  @override
  State<GroceryItemsDetails> createState() => _GroceryItemsDetailsState();
}

class _GroceryItemsDetailsState extends State<GroceryItemsDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.category.descriptionGrocery)
        ],
      )
    );
  }
}
