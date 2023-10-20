import 'package:sabico/architectures/domain/entities/MemberInfo.dart';

abstract class MemberRepository {
  Future<MemberInfo> memberInfo(String memberId);
}
