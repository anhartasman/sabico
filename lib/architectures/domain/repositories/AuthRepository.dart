import 'package:sabico/architectures/domain/entities/UserAccount.dart';
import 'package:sabico/architectures/domain/entities/UserAuth.dart';
import 'package:sabico/architectures/domain/entities/UserNewAccount.dart';

abstract class AuthRepository {
  Future<UserAccount> authenticate(UserAuth userAuth);
  Future<void> register(UserNewAccount newAccount);
}
