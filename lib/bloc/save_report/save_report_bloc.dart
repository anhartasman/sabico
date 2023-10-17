import 'package:bloc/bloc.dart';
import 'package:sabico/architectures/domain/usecases/SaveReportUseCase.dart';

import './bloc.dart';

class SaveReportBloc extends Bloc<SaveReportBlocEvent, SaveReportBlocState> {
  final SaveReportUseCase saveReportUseCase;
  SaveReportBloc({
    required this.saveReportUseCase,
  }) : super(SaveReportOnIdle()) {
    on<SaveReportBlocEvent>((event, emit) async {
      if (event is SaveReportBlocStart) {
        try {
          emit(SaveReportOnStarted());

          final failureOrTrivia = await saveReportUseCase(event.theReport);

          await failureOrTrivia.first;
          emit(SaveReportOnSuccess());
        } catch (e) {
          final theErrorMessage = e.toString();
          String labelError = "terjadi kesalahan, silahkan coba lagi";
          if (theErrorMessage.contains("invalid-verification-code")) {
            labelError = "kode OTP salah";
          } else if (theErrorMessage.contains("wrong")) {
            labelError = "Password salah";
          }
          emit(SaveReportOnError(
            errorMessage: labelError,
          ));
        }
      }
    });
  }
}
