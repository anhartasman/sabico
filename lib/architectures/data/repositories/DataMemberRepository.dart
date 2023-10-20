import 'package:logging/logging.dart';
import 'package:sabico/architectures/data/datasources/remote/member_remote_data_source.dart';
import 'package:sabico/architectures/domain/entities/MemberInfo.dart';
import 'package:sabico/architectures/domain/repositories/MemberRepository.dart';

class DataMemberRepository implements MemberRepository {
  late Logger _logger;

  DataMemberRepository() {
    _logger = Logger('DataMemberRepository');
  }

  @override
  Future<MemberInfo> memberInfo(String memberId) async {
    final reportList = await MemberRemoteDataSource.memberInfo(memberId);
    return reportList;
  }
}
