import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AnonymousAuthController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> loginWithAnonymous() async {
    isLoading.value = true;
    try {
      await auth.signInAnonymously();
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Failed with error code : ${e.code}', '${e.message}');
    } finally {
      isLoading.value = false;
    }
  }
}
