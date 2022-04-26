import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/models/category.dart';
import 'package:nectar_ui_ux/screens/shop_screen/shop_screen.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        title: Text(widget.category.nameGrocery, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.category.imgGrocery)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.category.descriptionGrocery,textAlign: TextAlign.start,),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
