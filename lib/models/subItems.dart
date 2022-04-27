import 'package:nectar_ui_ux/models/items.dart';

class SubItems extends Items {
  SubItems(
      {required String itemsName,
      required String itemsImg,
      required String borderColor,
      required String backColor,
      required String price,
      required String itemDescription,
      required List<Items> subItems})
      : super(
            itemsName: itemsName,
            itemsImg: itemsImg,
            borderColor: borderColor,
            backColor: backColor,
            price: price,
            itemDescription: itemDescription,
            subItems: subItems);
}
