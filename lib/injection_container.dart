import 'package:get_it/get_it.dart';
import 'package:sabico/architectures/data/repositories/DataAuthRepository.dart';
import 'package:sabico/architectures/data/repositories/DataMemberRepository.dart';
import 'package:sabico/architectures/data/repositories/DataReportRepository.dart';
import 'package:sabico/architectures/domain/repositories/AuthRepository.dart';
import 'package:sabico/architectures/domain/repositories/MemberRepository.dart';
import 'package:sabico/architectures/domain/repositories/ReportRepository.dart';
import 'package:sabico/architectures/domain/usecases/FamilyEvaluationSaveUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberDetailUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberSaveUseCase.dart';
import 'package:sabico/architectures/domain/usecases/MemberInfoUseCase.dart';
import 'package:sabico/architectures/domain/usecases/SaveReportUseCase.dart';
import 'package:sabico/architectures/domain/usecases/ProcessReportUseCase.dart';
import 'package:sabico/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:sabico/architectures/domain/usecases/UserRegisterUseCase.dart';
import 'package:sabico/architectures/domain/usecases/UserReportListUseCase.dart';
import 'package:sabico/bloc/family_evaluation_history/family_evaluation_history_bloc.dart';
import 'package:sabico/bloc/family_evaluation_save/family_evaluation_save_bloc.dart';
import 'package:sabico/bloc/member_info/member_info_bloc.dart';
import 'package:sabico/bloc/process_report/process_report_bloc.dart';
import 'package:sabico/bloc/save_report/save_report_bloc.dart';
import 'package:sabico/bloc/splash_check/splash_check_bloc.dart';
import 'package:sabico/bloc/user_login/user_login_bloc.dart';
import 'package:sabico/bloc/user_register/user_register_bloc.dart';
import 'package:sabico/bloc/user_report_list/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => UserReportListUseCase(sl()));
  sl.registerLazySingleton(() => FamilyMemberSaveUseCase(sl()));
  sl.registerLazySingleton(() => FamilyMemberDetailUseCase(sl()));
  sl.registerLazySingleton(() => FamilyEvaluationSaveUseCase(sl()));
  sl.registerLazySingleton(() => ProcessReportUseCase(sl()));
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => UserRegisterUseCase(sl()));
  sl.registerLazySingleton(() => SaveReportUseCase(sl()));
  sl.registerLazySingleton(() => MemberInfoUseCase(sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => DataAuthRepository(),
  );
  sl.registerLazySingleton<ReportRepository>(
    () => DataReportRepository(),
  );
  sl.registerLazySingleton<MemberRepository>(
    () => DataMemberRepository(),
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
    () => UserRegisterBloc(
      userRegisterUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SaveReportBloc(
      saveReportUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => MemberInfoBloc(
      memberInfoUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => ProcessReportBloc(
      processReportUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FamilyEvaluationHistoryBloc(
      familyEvaluationHistoryUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SplashCheckBloc(),
  );
}
