import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/helper/second_utils.dart';
import 'package:nectar_ui_ux/models/items.dart';
import 'package:nectar_ui_ux/screens/explore_screen/explore_deatils_screen.dart';
import 'package:nectar_ui_ux/widgets/custom_textfeild.dart';

import '../../models/category.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  List<Items> items = SecondUtils.getMockedItems();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Find Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            CustomTextField(),
            GridView.builder(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            ExploreDetailsScreen(items: items[index],)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(int.parse(items[index].borderColor))),
                          color: Color(int.parse(items[index].backColor)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                  width: 150,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                    child: Image.network(items[index].itemsImg,
                                      fit: BoxFit.cover,
                                    ))),
                          ),
                          Text(
                            items[index].itemsName,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      )
    );
  }
  // void searchItems(String query) {
  //   final suggestions = items.where((Items) {
  //     final itemsName = Items.itemsName.toLowerCase();
  //     final input = query.toLowerCase();
  //
  //     return itemsName.contains(input);
  //   });
  //   setState(() => items = suggestions);
  }

