import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sabico/bloc/save_report/save_report_bloc.dart';
import 'package:sabico/bloc/user_login/user_login_bloc.dart';
import 'package:sabico/bloc/user_register/user_register_bloc.dart';
import 'package:sabico/injection_container.dart' as di;
import 'package:sabico/middlewares/member_guard.dart';
import 'package:sabico/routes/app_routes.dart';
import 'package:sabico/screens/form_laporan.dart';
import 'package:sabico/screens/form_register.dart';
import 'package:sabico/screens/home_page.dart';
import 'package:sabico/screens/login_admin.dart';
import 'package:sabico/screens/ruang_admin_page.dart';
import 'package:sabico/screens/splash_screen.dart';

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
    middlewares: [
      MemberGuard(), // Add the middleware here
    ],
  ),
  GetPage(
    name: Routes.adminPageRoute,
    page: () {
      return ruang_admin_page();
    },
    middlewares: [
      MemberGuard(), // Add the middleware here
    ],
  ),
  GetPage(
    name: Routes.authLoginRoute,
    page: () => BlocProvider<UserLoginBloc>(
        create: (BuildContext context) => di.sl<UserLoginBloc>(),
        child: login_admin()),
  ),
  GetPage(
    name: Routes.authRegisterRoute,
    page: () => BlocProvider<UserRegisterBloc>(
        create: (BuildContext context) => di.sl<UserRegisterBloc>(),
        child: form_register()),
  ),
  GetPage(
    name: Routes.formReportRoute,
    page: () => BlocProvider<SaveReportBloc>(
      create: (BuildContext context) => di.sl<SaveReportBloc>(),
      child: form_laporan(),
    ),
  ),
];
