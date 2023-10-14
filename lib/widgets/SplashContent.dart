import 'package:flutter/material.dart';
import 'package:sabico/theme/colors/light_colors.dart';

class SplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image.asset(
            "assets/icon/app_icon.png",
          ),
        ),
      ],
    );
  }
}
