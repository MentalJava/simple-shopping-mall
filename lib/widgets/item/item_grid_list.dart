import 'package:flutter/material.dart';
import 'package:simple_shopping_mall/models/item.dart';

class ItemGridList extends StatelessWidget {
  const ItemGridList({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color.fromRGBO(222, 216, 216, 1),
          ),
        ),
        child: Column(
          children: [
            Image.network(
              item.imageUrl,
              width: 50,
              height: 50,
            ),
            Text(item.name),
            Text(item.price),
          ],
        ),
      ),
    );
  }
}
