import 'dart:async';

import 'package:sabico/architectures/domain/entities/UserReport.dart';
import 'package:sabico/architectures/domain/repositories/ReportRepository.dart';
import 'package:sabico/architectures/usecase/usecase.dart';

class UserReportListUseCase extends UseCase<List<UserReport>, NoParams> {
  UserReportListUseCase(this.repository);

  final ReportRepository repository;

  @override
  Future<Stream<List<UserReport>>> call(
    NoParams params,
  ) async {
    final StreamController<List<UserReport>> controller = StreamController();

    repository.reportList().then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
