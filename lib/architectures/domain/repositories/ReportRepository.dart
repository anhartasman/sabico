import 'package:sabico/architectures/domain/entities/UserReport.dart';

abstract class ReportRepository {
  Future<List<UserReport>> reportList();
}
