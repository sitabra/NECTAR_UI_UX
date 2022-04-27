class Items{
   String itemsName;
   String itemsImg;
   String borderColor;
   String backColor;
   String price;
   String itemDescription;
   List<Items> subItems;

   Items ({
     required this.itemsName,
     required this.itemsImg,
     required this.borderColor,
     required this.backColor,
     required this.price,
     required this.itemDescription,
     required this.subItems,
});
}