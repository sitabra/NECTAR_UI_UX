// import 'dart:ui';

class Category {
  String name;
  String imgName;
  String price;
  String description;
  String vegName;
  String vegImg;
  String vegDescription;
  String vegPrice;
  String meatImg;
  String meatName;
  String meatPrice;
  String meatDesc;
  String nameGrocery;
  String imgGrocery;
  String descriptionGrocery;
  String colorCode;
  List<Category> subCategories;

  Category(
  {
    required this.name,
    required this.imgName,
    required this.price,
    required this.description,
    required this.subCategories,
    required this.vegName,
    required this.vegDescription,
    required this.vegImg,
    required this.vegPrice,
    required this.meatImg,
    required this.meatDesc,
    required this.meatName,
    required this.meatPrice,
    required this.nameGrocery,
    required this.imgGrocery,
    required this.descriptionGrocery,
    required this.colorCode,
  }
  );
}