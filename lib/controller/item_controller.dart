import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemController extends GetxController {
  var image = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final isLoading = false.obs;

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

      await firestore.collection('item').add({
        'name': name,
        'price': price,
        'description': description,
        'imageUrl': downloadUrl,
      });

      Get.snackbar('Success', 'Item Uploaded Successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload Item');
    } finally {
      isLoading.value = false;
    }
  }
}
