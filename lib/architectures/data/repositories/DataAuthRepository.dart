import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';
import 'package:sabico/architectures/domain/entities/UserAccount.dart';
import 'package:sabico/architectures/domain/entities/UserAuth.dart';
import 'package:sabico/architectures/domain/entities/UserProfile.dart';
import 'package:sabico/architectures/domain/repositories/AuthRepository.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataAuthRepository implements AuthRepository {
  late Logger _logger;

  DataAuthRepository() {
    _logger = Logger('DataAuthRepository');
  }

  Future<UserAccount> authenticate(UserAuth userAuth) async {
    _logger.info("Auth email ${userAuth.email} password ${userAuth.password}");

    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    _logger.info("login email: " + userAuth.email);
    _logger.info("login password: " + userAuth.password);
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: userAuth.email,
      password: userAuth.password,
    ))
        // final User? user = (await _auth.signInWithEmailAndPassword(
        //   email: "120001@pastani.id",
        //   password: "88776655",
        // ))
        .user;
    if (user == null) {
      throw ("User not found");
    }

    return UserAccount(
      id: user.uid,
      email: userAuth.email,
      phone: user.phoneNumber ?? "",
      profil: UserProfile(
        nama: user.displayName ?? "",
      ),
    );
  }
}
