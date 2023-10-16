import 'package:get_it/get_it.dart';
import 'package:sabico/architectures/data/repositories/DataAuthRepository.dart';
import 'package:sabico/architectures/data/repositories/DataReportRepository.dart';
import 'package:sabico/architectures/domain/repositories/AuthRepository.dart';
import 'package:sabico/architectures/domain/repositories/ReportRepository.dart';
import 'package:sabico/architectures/domain/usecases/FamilyEvaluationHistoryUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyEvaluationSaveUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberDetailUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberSaveUseCase.dart';
import 'package:sabico/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:sabico/architectures/domain/usecases/UserReportListUseCase.dart';
import 'package:sabico/bloc/family_evaluation_history/family_evaluation_history_bloc.dart';
import 'package:sabico/bloc/family_evaluation_save/family_evaluation_save_bloc.dart';
import 'package:sabico/bloc/family_member_detail/family_member_detail_bloc.dart';
import 'package:sabico/bloc/family_member_save/family_member_save_bloc.dart';
import 'package:sabico/bloc/user_login/user_login_bloc.dart';
import 'package:sabico/bloc/user_report_list_bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => UserReportListUseCase(sl()));
  sl.registerLazySingleton(() => FamilyMemberSaveUseCase(sl()));
  sl.registerLazySingleton(() => FamilyMemberDetailUseCase(sl()));
  sl.registerLazySingleton(() => FamilyEvaluationSaveUseCase(sl()));
  sl.registerLazySingleton(() => FamilyEvaluationHistoryUseCase(sl()));
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => DataAuthRepository(),
  );
  sl.registerLazySingleton<ReportRepository>(
    () => DataReportRepository(),
  );
  sl.registerFactory(
    () => UserReportListBloc(
      userReportListUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => UserLoginBloc(
      userLoginUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FamilyMemberSaveBloc(
      familyMemberSaveUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FamilyMemberDetailBloc(
      familyMemberDetailUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FamilyEvaluationSaveBloc(
      familyEvaluationSaveUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FamilyEvaluationHistoryBloc(
      familyEvaluationHistoryUseCase: sl(),
    ),
  );
}
