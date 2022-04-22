// import 'dart:ui';

class Category {
  String name;
  String imgName;
  String price;
  List<Category> subCategories;

  Category(
  {
    required this.name,
    required this.imgName,
    required this.price,
    required this.subCategories
  }
  );
}