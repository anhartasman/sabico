import 'package:sabico/architectures/domain/entities/UserAccount.dart';
import 'package:sabico/architectures/domain/entities/UserAuth.dart';

abstract class AuthRepository {
  Future<UserAccount> authenticate(UserAuth userAuth);
}
