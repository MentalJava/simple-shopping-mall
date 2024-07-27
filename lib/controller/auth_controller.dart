import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isGoogleLoading = false.obs;
  var isAnonymousLoading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.value = auth.currentUser;
  }

  Future<void> loginWithAnonymous() async {
    isAnonymousLoading.value = true;
    try {
      await auth.signInAnonymously();
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Failed with error code : ${e.code}', '${e.message}');
    } finally {
      isAnonymousLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    isGoogleLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        isGoogleLoading.value = false;
        Get.snackbar(
            'Error', 'Google Sign-in was aborted by user'); // 사용자가 로그인을 취소한 경우
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Failed with error code : ${e.code}', '${e.message}');
    } finally {
      isGoogleLoading.value = false;
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
      Get.offAllNamed('/');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Failed with error code : ${e.code}', '${e.message}');
    }
  }
}
