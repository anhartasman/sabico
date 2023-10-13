import 'package:sabico/architectures/data/repositories/DataFamilyRepository.dart';
import 'package:sabico/architectures/domain/repositories/FamilyRepository.dart';
import 'package:sabico/architectures/domain/usecases/FamilyEvaluationHistoryUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyEvaluationSaveUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberDetailUseCase.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberListUseCase.dart';
import 'package:get_it/get_it.dart';
import 'package:sabico/architectures/domain/usecases/FamilyMemberSaveUseCase.dart';
import 'package:sabico/bloc/family_evaluation_history/family_evaluation_history_bloc.dart';
import 'package:sabico/bloc/family_evaluation_save/family_evaluation_save_bloc.dart';
import 'package:sabico/bloc/family_member_detail/family_member_detail_bloc.dart';
import 'package:sabico/bloc/family_member_list/family_member_list_bloc.dart';
import 'package:sabico/bloc/family_member_save/family_member_save_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => FamilyMemberListUseCase(sl()));
  sl.registerLazySingleton(() => FamilyMemberSaveUseCase(sl()));
  sl.registerLazySingleton(() => FamilyMemberDetailUseCase(sl()));
  sl.registerLazySingleton(() => FamilyEvaluationSaveUseCase(sl()));
  sl.registerLazySingleton(() => FamilyEvaluationHistoryUseCase(sl()));
  // Repository
  sl.registerLazySingleton<FamilyRepository>(
    () => DataFamilyRepository(),
  );
  sl.registerFactory(
    () => FamilyMemberListBloc(
      familyMemberListUseCase: sl(),
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
