import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sabico/architectures/domain/entities/UserAccount.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;
  bool isLoggedIn = false;
  UserAccount? theUser;
  void setIsLoggedIn(
    bool newValue, {
    UserAccount? newUser,
  }) {
    isLoggedIn = newValue;
    if (newValue) {
      theUser = newUser;
    }
  }

  Future<void> logout() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }
}
