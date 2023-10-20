import 'package:logging/logging.dart';
import 'package:sabico/architectures/data/datasources/remote/report_remote_data_source.dart';
import 'package:sabico/architectures/domain/entities/ReportFilter.dart';
import 'package:sabico/architectures/domain/entities/UserReport.dart';
import 'package:sabico/architectures/domain/repositories/ReportRepository.dart';

class DataReportRepository implements ReportRepository {
  late Logger _logger;

  DataReportRepository() {
    _logger = Logger('DataReportRepository');
  }

  @override
  Future<List<UserReport>> reportList(ReportFilter theFilter) async {
    final reportList = await ReportRemoteDataSource.reportList(theFilter);
    return reportList;
  }

  @override
  Future<void> saveReport(UserReport theReport) async {
    await ReportRemoteDataSource.saveReport(theReport);
  }
}
