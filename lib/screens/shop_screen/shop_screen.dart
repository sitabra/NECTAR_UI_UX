import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/helper/utils.dart';
import 'package:nectar_ui_ux/screens/grocery_items-details/grocery_items_details.dart';
import 'package:nectar_ui_ux/widgets/custom_Float_action_button.dart';

import '../../models/category.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  final List<String> imagesList = [
    'https://cdn.shpy.in/35660/_slider/1626842517877_slide_1626842522027.png?',
    'https://pub-static.fotor.com/assets/projects/pages/3d4d74c0-f53c-11e9-9514-3f31cfb386e6_12ddd30c-5a94-4145-9034-5c6b0a462df2_thumb.jpg',
    'https://blog.locus.sh/wp-content/uploads/2020/04/Banner-image.jpg',
    'https://i.pinimg.com/originals/25/9a/c9/259ac947325fb10b4640e624439f1040.jpg',
    'https://st2.depositphotos.com/7341970/11081/v/950/depositphotos_110818802-stock-illustration-grocery-shopping-discount-banner.jpg',
  ];


  int _currentIndex = 0;

  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
                width: 50,
                child: Image.asset('assets/image/pngcarrot.png', fit: BoxFit.fill,)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text("Dhaka,"),
                Text("Banassre"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search,color: Colors.black,),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
                Stack(
                  children: [
                    Container(
                    width: double.infinity,
                     height: 100,
                     child: CarouselSlider(
                      options: CarouselOptions(
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(
                              () {
                            _currentIndex = index;
                          },
                        );
                      },
                    ),
                    items: imagesList.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child:
                            Container(
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                      ),
                    ).toList(),
                  ),
                 ),
                    Positioned(
                      top: 75,
                      left: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imagesList.map((urlOfItem) {
                          int index = imagesList.indexOf(urlOfItem);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Color.fromRGBO(0, 0, 0, 0.8)
                                  : Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ]
                ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exclusive Offer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  TextButton(
                      onPressed: () {},
                      child: Text("See all",style: TextStyle(color: Colors.green),))
                ],
              ),
            ),
            Container(
              height: 270,
              child: ListView.builder(
                itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                return Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 130,
                                    // width: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(categories[index].imgName, fit: BoxFit.cover,)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text(categories[index].name),
                                    Text(categories[index].description,
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("\$" + categories[index].price),
                                    CustomFloatActionButton(),
                                  ],
                                ),
                              ],
                            )
                          );
              }
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Selling", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  TextButton(
                      onPressed: () {},
                      child: Text("See all", style: TextStyle(color: Colors.green),))
                ],
              ),
            ),
            Container(
                height: 270,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 140,
                                  width: 150,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                      child: Image.network(categories[index].vegImg, fit: BoxFit.cover,)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(categories[index].vegName),
                                    Text(categories[index].vegDescription, style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("\$" + categories[index].vegPrice),
                                  CustomFloatActionButton()
                                ],
                              ),
                            ],
                          )
                      );
                    }
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Groceries", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  TextButton(
                      onPressed: () {},
                      child: Text("See all", style: TextStyle(color: Colors.green),))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    height: 90,
                    child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                  GroceryItemsDetails(category: categories[index],)));
                            },
                            child: Container(
                                margin: EdgeInsets.all(10),
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(categories[index].colorCode)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2),
                                      height: 65,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 70,
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: Image.network(categories[index].imgGrocery, fit: BoxFit.cover,))),
                                              ),
                                              Text(categories[index].nameGrocery, style: TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          )),
                                    ),
                                  ],
                                )
                            ),
                          );
                        }
                    )
                ),
                Container(
                    height: 270,
                    child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.all(10),
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 140,
                                      width: 150,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(categories[index].meatImg, fit: BoxFit.cover,)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(categories[index].meatName),
                                        Text(categories[index].meatDesc, style: TextStyle(color: Colors.grey),)
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("\$" + categories[index].meatPrice),
                                      CustomFloatActionButton(),
                                    ],
                                  ),
                                ],
                              )
                          );
                        }
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
