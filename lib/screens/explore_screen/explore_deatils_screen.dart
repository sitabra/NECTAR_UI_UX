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
        title: Container(
          width: 180,
          child: Text(widget.items.itemsName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                itemCount: widget.items.subItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(int.parse(widget.items.subItems[index].borderColor))),
                          color: Color(int.parse(widget.items.subItems[index].backColor)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  height: 70,
                                  width: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(widget.items.subItems[index].itemsImg,
                                        fit: BoxFit.contain,
                                      ))),
                            ),
                            Text(widget.items.subItems[index].itemsName,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(widget.items.subItems[index].itemDescription,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("\$" + widget.items.subItems[index].price),
                                FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: Colors.green,
                                  mini: true,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
