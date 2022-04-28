import 'package:flutter/material.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  final List<String> favName = [
    "Sprite Can",
    "Diet Coke",
    "Apple Juice",
    "Coca-Cola Can",
    "Pepsi Can",
    "Thumbs Up Can"
  ];

  final List<String> favImg = [
    "https://5.imimg.com/data5/UE/NE/WQ/SELLER-82456434/sprinte-cold-derink-500x500.jpg",
    "https://thehungrypigcafe.com/wp-content/uploads/DIET-COKE.jpg",
    "https://5.imimg.com/data5/WQ/AU/UM/SELLER-85767966/green-apple-fresh-fruit-juice-500x500.jpg",
    "https://grocerybazaar.pk/wp-content/uploads/2020/04/1117826-1.jpeg",
    "https://www.bigbasket.com/media/uploads/p/xxl/1203727-2_5-pepsi-swag-can.jpg",
    "https://d1z88p83zuviay.cloudfront.net/ProductVariantThumbnailImages/0c83a890-2dd8-4f57-9510-2639c2b4133f_425x425.jpg"
  ];

  final List<String> favDesc = [
    "335 ml, price",
    "355 ml, price",
    "3 L, price",
    "350 ml, price",
    "335 ml, price",
    "300 ml, price"
  ];

  final List<String> favPrice = [
    "9.99",
    "7.99",
    "5.99",
    "4.99",
    "8.99",
    "5.99"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Text("Favourites", style: TextStyle(color: Colors.black),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(favImg[index],fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(favName[index], style: TextStyle(fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(favDesc[index], style: TextStyle(color: Colors.grey),),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text("\$"+favPrice[index]),
                              IconButton(onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder:  (context, position) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                  );
                },
                itemCount: favName.length
            ),
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
                        Text("Add all to cart", style: TextStyle(color: Colors.white),),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
