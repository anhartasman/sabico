import 'package:bloc/bloc.dart';
import 'package:sabico/architectures/domain/usecases/MemberInfoUseCase.dart';
import 'package:sabico/architectures/usecase/usecase.dart';

import './bloc.dart';

class MemberInfoBloc extends Bloc<MemberInfoBlocEvent, MemberInfoBlocState> {
  final MemberInfoUseCase memberInfoUseCase;

  MemberInfoBloc({
    required this.memberInfoUseCase,
  }) : super(MemberInfoBlocStateOnIdle()) {
    on<MemberInfoBlocEvent>((event, emit) async {
      if (event is MemberInfoBlocRetrieve) {
        emit(MemberInfoBlocStateOnStarted());
        final failureOrTrivia = await memberInfoUseCase(event.memberId);

        try {
          var memberInfo = await failureOrTrivia.first;

          emit(MemberInfoBlocStateOnSuccess(
            memberInfo,
          ));
        } catch (e) {
          emit(MemberInfoBlocStateOnError(e.toString()));
        }
      }
    });
  }
}
