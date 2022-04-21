import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                child: Image.asset('assets/image/pngcarrot.png', fit: BoxFit.fill,)),
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
            Container(
              width: double.infinity,
              height: 100,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  // enlargeCenterPage: true,
                  //scrollDirection: Axis.vertical,
                  onPageChanged: (index, reason) {
                    setState(
                          () {
                        _currentIndex = index;
                      },
                    );
                  },
                ),
                items: imagesList
                    .map(
                      (item) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
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
                        Positioned(
                          top: 75,
                          left: 100,
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
                      ],
                    ),
                  ),
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exclusive Offer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  TextButton(
                      onPressed: () {},
                      child: Text("See all"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
