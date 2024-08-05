import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_mall/models/item.dart';
import 'package:simple_shopping_mall/screens/home_detail.dart';

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
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color.fromRGBO(155, 152, 152, 0.498),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: 110,
              child: Hero(
                tag: item.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(item.price),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                ),
                onPressed: () {
                  Get.to(
                    () => HomeDetail(item: item),
                  );
                },

                child: const Text(
                  'more',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
