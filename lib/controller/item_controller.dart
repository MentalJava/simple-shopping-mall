import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_shopping_mall/controller/auth_controller.dart';
import 'package:simple_shopping_mall/models/item.dart';

class ItemController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  var image = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final isLoading = false.obs;
  final thumbsUpCount = 0.obs;
  final userHasThumbsUp = false.obs;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> uploadItem(String name, price, description) async {
    if (image.value == null) {
      Get.snackbar('Error', 'Please select an image');
      return;
    }

    isLoading.value = true;
    try {
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      UploadTask uploadTask =
          storage.ref().child('images/$fileName').putFile(image.value!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await firestore.collection('items').add({
        'name': name,
        'price': price,
        'description': description,
        'imageUrl': downloadUrl,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'thumbsUpCount': 0,
        'thumbsUpByUsers': {},
      });

      Get.snackbar('Success', 'Item Uploaded Successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload Item');
    } finally {
      isLoading.value = false;
    }
  }

  Stream<List<Item>> getItems() {
    return firestore.collection('items').snapshots().map(
      (QuerySnapshot query) {
        List<Item> items = [];
        for (var item in query.docs) {
          items.add(
            Item.fromDocumentSnapshot(item),
          );
        }
        return items;
      },
    );
  }

  Future<void> deleteItems(String itemId) async {
    isLoading.value = true;
    try {
      await firestore.collection('items').doc(itemId).delete();
      Get.snackbar('Success', 'item Deleted Successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete item');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleThumbsUp(String itemId, userId) async {
    DocumentReference itemRef = firestore.collection('items').doc(itemId);

    try {
      DocumentSnapshot itemSnapshot = await itemRef.get();

      if (!itemSnapshot.exists) {
        throw Exception("item does not exist!");
      }
      Map<String, dynamic> thumbsUpByUsers =
          itemSnapshot['thumbsUpByUsers'] ?? {};
      if (thumbsUpByUsers[userId] == true) {
        Get.snackbar(
          'Thumbs Up',
          'You can only do it once !!',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        await itemRef.update(
          {
            'thumbsUpCount': FieldValue.increment(1),
            'thumbsUpByUsers': {userId: true},
          },
        );
        Get.snackbar(
          'Thumbs Up',
          'I LIKE IT !!',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to recommend this product.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
