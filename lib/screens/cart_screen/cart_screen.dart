import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final List<String> itemName = [
    "Bell pepper Red",
    "Egg Chicken Red",
    "Organic Bananas",
    "Ginger",
    "Mango",
    "Fried Waffle"
  ];

  final List<String> listImage = [
    "https://cdn.shopify.com/s/files/1/0258/4307/3103/products/Red_bell_pepper_1024x.jpg?v=1579689969",
    "https://5.imimg.com/data5/OI/WS/HR/SELLER-13871848/kadaknath-chicken-egg-500x500.jpg",
    "https://m.media-amazon.com/images/I/61fZ+YAYGaL._SL1500_.jpg",
    "https://m.media-amazon.com/images/I/61SCxbFGpWL._SX679_.jpg",
    "https://www.svz.com/wp-content/uploads/2018/05/Mango.jpg",
    "https://media.istockphoto.com/photos/waffle-potato-fries-picture-id180736943?k=20&m=180736943&s=612x612&w=0&h=UKeTDgxSiBXI7yTOmkMiUfmM_xQktRXns__bWY2JCN4="
  ];

  final List<String> itemDes = [
    "1 kg",
    "10 pcs",
    "12 pcs",
    "5 kg",
    "7 kg",
    "2 pcs"
  ];

  final List<String> itemCount = [
    "1",
    "10",
    "12",
    "5",
    "7",
    "2"
  ];

  final List<String> itemPrice = [
    "3.99",
    "10.99",
    "7.99",
    "4.99",
    "7.99",
    "2.99"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Text("My Cart", style: TextStyle(color: Colors.black),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 132,
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(listImage[index],fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Text(itemName[index], style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                child: Text(itemDes[index], style: TextStyle(color: Colors.grey),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    FloatingActionButton(
                                      elevation: 0,
                                      backgroundColor: Colors.white60,
                                      mini: true,
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      child: Icon(Icons.remove, color: Colors.grey,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(itemCount[index]),
                                    ),
                                    FloatingActionButton(
                                      elevation: 0,
                                      backgroundColor: Colors.white60,
                                      mini: true,
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      child: Icon(Icons.add, color: Colors.green,),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                            SizedBox(height: 50,),
                            Text("\$" + itemPrice[index], style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ));
              },
              separatorBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 0.3,
                    color: Colors.black,
                  ),
                );
              },
              itemCount: itemName.length,
            ),
            Stack(
              children:[
                Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Go to Check Out", style: TextStyle(color: Colors.white),),
                        ],
                      )),
                ),
              ),
              Positioned(
                right: 60,
                  bottom: 40,
                  child: Container(
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text("\$29.99", style: TextStyle(color: Colors.white,fontSize: 9, fontWeight: FontWeight.bold),)),
                  ))
            ]
            )
          ],
        ),
      ),
    );
  }
}
