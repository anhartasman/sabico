import 'package:sabico/architectures/domain/entities/ReportChanges.dart';
import 'package:sabico/architectures/domain/entities/ReportFilter.dart';
import 'package:sabico/architectures/domain/entities/UserReport.dart';

abstract class ReportRepository {
  Future<List<UserReport>> reportList(ReportFilter theFilter);
  Future<void> saveReport(UserReport theReport);
  Future<void> processReport(ReportChanges reportChange);
}
