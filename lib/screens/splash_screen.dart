import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sabico/bloc/splash_check/bloc.dart';
import 'package:sabico/routes/app_routes.dart';
import 'package:sabico/screens/SplashCheckAuth.dart';
import 'package:sabico/screens/SplashCheckPermission.dart';
import 'package:sabico/theme/colors/light_colors.dart';
import 'package:sabico/widgets/SplashContent.dart';
import 'package:sabico/injection_container.dart' as di;

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return BlocProvider<SplashCheckBloc>(
      create: (BuildContext context) => di.sl<SplashCheckBloc>(),
      child: Scaffold(
        // backgroundColor: LightColors.kLightYellow,
        backgroundColor: Colors.white,
        body: BlocConsumer<SplashCheckBloc, SplashCheckBlocState>(
            listener: (context, state) {
          if (state is SplashCheckOnSuccess) {
            Future.delayed(Duration(milliseconds: 500))
                .then((value) => Get.offNamed(Routes.homeMenuRoute));
          }
        }, builder: (BuildContext context, state) {
          if (state is SplashCheckOnIdle) {
            return SplashCheckPermission();
          }
          if (state is SplashCheckOnAuth) {
            return SplashCheckAuth();
          }
          return SplashContent();
        }),
      ),
    );
  }
}
