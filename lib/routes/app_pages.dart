import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sabico/architectures/domain/entities/FamilyMember.dart';
import 'package:sabico/bloc/family_evaluation_history/family_evaluation_history_bloc.dart';
import 'package:sabico/bloc/family_evaluation_history/family_evaluation_history_bloc_event.dart';
import 'package:sabico/bloc/family_evaluation_save/family_evaluation_save_bloc.dart';
import 'package:sabico/bloc/family_member_detail/bloc.dart';
import 'package:sabico/bloc/family_member_save/family_member_save_bloc.dart';
import 'package:sabico/helpers/extensions/ext_string.dart';
import 'package:sabico/routes/app_routes.dart';
import 'package:sabico/injection_container.dart' as di;
import 'package:sabico/screens/child_profile.dart';
import 'package:sabico/screens/evaluation_history.dart';
import 'package:sabico/screens/form_child.dart';
import 'package:sabico/screens/form_evaluation.dart';
import 'package:sabico/screens/home_page.dart';
import 'package:sabico/screens/report_evaluation.dart';
import 'package:sabico/screens/splash_screen.dart';
import 'package:sabico/theme/colors/Warna.dart';
import 'package:sabico/theme/colors/light_colors.dart';

final appPages = [
  GetPage(
    name: Routes.homeRoute,
    page: () => splash_screen(),
  ),
  GetPage(
    name: Routes.homeMenuRoute,
    page: () {
      // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   systemNavigationBarColor:
      //       LightColors.kLightYellow, // navigation bar color
      //   statusBarColor: Warna.warnaUtama, // status bar color
      // ));
      return HomePage();
    },
  ),
  GetPage(
    name: Routes.formChildRoute,
    page: () => BlocProvider<FamilyMemberSaveBloc>(
      create: (BuildContext context) => di.sl<FamilyMemberSaveBloc>(),
      child: form_child(),
    ),
  ),
  GetPage(
    name: Routes.formEvaluationRoute,
    page: () {
      final childId = Get.arguments["childId"];
      return BlocProvider<FamilyEvaluationSaveBloc>(
        create: (BuildContext context) => di.sl<FamilyEvaluationSaveBloc>(),
        child: form_evaluation(
          childId: childId,
        ),
      );
    },
  ),
  GetPage(
    name: Routes.reportEvaluationRoute,
    page: () {
      FamilyMember theChild = Get.arguments;
      return MultiBlocProvider(
        providers: [
          BlocProvider<FamilyEvaluationSaveBloc>(
              create: (BuildContext context) =>
                  di.sl<FamilyEvaluationSaveBloc>()),
        ],
        child: report_evaluation(
          theChild: theChild,
        ),
      );
    },
  ),
  GetPage(
    name: Routes.evaluationHistoryRoute,
    page: () {
      final childId = Get.arguments["childId"];
      final firstDate = Get.arguments["firstDate"] as DateTime;
      final lastDate = Get.arguments["lastDate"] as DateTime;
      print("search childId $childId");
      print("search firstDate $firstDate");
      print("search lastDate $lastDate");
      return MultiBlocProvider(
        providers: [
          BlocProvider<FamilyEvaluationHistoryBloc>(
              create: (BuildContext context) =>
                  di.sl<FamilyEvaluationHistoryBloc>()
                    ..add(FamilyEvaluationHistoryBlocStart(
                      firstDate.toTanggal("yyyy-MM-dd"),
                      lastDate.toTanggal("yyyy-MM-dd"),
                      childId,
                    ))),
        ],
        child: evaluation_history(
          childId: childId,
          firstDate: firstDate,
          lastDate: lastDate,
        ),
      );
    },
  ),
  GetPage(
    name: Routes.detailChildRoute,
    page: () {
      final id = Get.arguments["id"];
      final cardColor = Get.arguments["cardColor"] as Color;
      final circleColor = Get.arguments["circleColor"] as Color;
      return BlocProvider<FamilyMemberDetailBloc>(
        create: (BuildContext context) => di.sl<FamilyMemberDetailBloc>()
          ..add(FamilyMemberDetailBlocRetrieve(id)),
        child: child_profile(
          cardColor: cardColor,
          circleColor: circleColor,
        ),
      );
    },
  ),
];
