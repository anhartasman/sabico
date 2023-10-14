import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabico/screens/evaluation_child_page.dart';
import 'package:sabico/screens/form_laporan.dart';
import 'package:sabico/screens/read_penggunaan_gadget.dart';
import 'package:sabico/screens/read_tips_solusi.dart';
import 'package:sabico/screens/ruang_admin_page.dart';
import 'package:sabico/theme/colors/light_colors.dart';

class HomePage extends StatefulWidget {
  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: LightColors.kLightYellow,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo_sabico.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.to(read_penggunaan_gadget()),
                        child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFAEDBF8),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        "assets/images/online_tech.png")),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text("Edukasi",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.to(form_laporan()),
                        child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFF8C7AE),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        "assets/images/book_lover.png")),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text("Form Laporan",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: InkWell(
                  onTap: () => Get.to(ruang_admin_page()),
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8AEAE),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                  "assets/images/thinking_face.png")),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text("Admin SABICO",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
