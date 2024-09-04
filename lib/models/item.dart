import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String name;
  String price;
  String description;
  String imageUrl;
  Timestamp createdAt;
  Timestamp updatedAt;
  int thumbsUpCount;
  Map<String, dynamic> thumbsUpByUsers;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.thumbsUpCount,
    required this.thumbsUpByUsers,
  });

  factory Item.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Item(
      id: doc.id,
      name: doc['name'],
      price: doc['price'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
      createdAt: doc['createdAt'],
      updatedAt: doc['updatedAt'],
      thumbsUpCount: doc['thumbsUpCount'],
      thumbsUpByUsers: doc['thumbsUpByUsers'],
    );
  }
}
