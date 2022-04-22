import 'package:nectar_ui_ux/models/category.dart';

class Utils{

  static List<Category> getMockedCategories() {
    return [
      Category(
          name: "Mango",
          imgName: "assets/image/download.jpg",
          price: "4.99",
          subCategories: []
      ),
      Category(
          name: "Apple",
          imgName: "assets/image/download1.jpg",
          price: "7.99",
          subCategories: []
      ),
      Category(
          name: "Banana",
          imgName: "assets/image/download2.jpg",
          price: "5.99",
          subCategories: []
      ),
      Category(
          name: "Orange",
          imgName: "assets/image/download3.jpg",
          price: "2.99",
          subCategories: []
      ),
    ];
  }
}