import 'package:sabico/architectures/domain/entities/ReportChanges.dart';

abstract class ProcessReportBlocEvent {}

class ProcessReportBlocStart extends ProcessReportBlocEvent {
  final ReportChanges reportChange;
  ProcessReportBlocStart(this.reportChange);
}
