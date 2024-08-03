import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String name;
  String price;
  String description;
  String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory Item.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Item(
      id: doc.id,
      name: doc['name'],
      price: doc['price'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
    );
  }
}
