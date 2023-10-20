import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabico/routes/app_routes.dart';
import 'package:sabico/screens/evaluation_child_page.dart';
import 'package:sabico/screens/laporan_list_page.dart';
import 'package:sabico/screens/read_penggunaan_gadget.dart';
import 'package:sabico/screens/read_tips_solusi.dart';
import 'package:sabico/services/auth_service.dart';
import 'package:sabico/theme/colors/light_colors.dart';
import 'package:sabico/widgets/TampilanDialog.dart';
import 'package:sabico/widgets/task_column.dart';
import 'package:sabico/widgets/top_container.dart';

class ruang_admin_page extends StatelessWidget {
  const ruang_admin_page({super.key});

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
    final authService = Get.find<AuthService>();

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: AppBar(
        title: const Text("User SABICO"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Color(0xFF072541),
      ), //
      body: Column(
        children: <Widget>[
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Laporan'),
                          SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: InkWell(
                              onTap: () => Get.to(laporan_list_page()),
                              child: TaskColumn(
                                icon: Icons.edit,
                                iconBackgroundColor: LightColors.kRed,
                                title: 'Daftar Laporan',
                                subtitle: 'Laporan yang masuk',
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40, bottom: 16.0),
                            child: subheading('Akun'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: InkWell(
                              onTap: () =>
                                  TampilanDialog.showDialogKonfirm("Logout?")
                                      .then((value) {
                                if (value) {
                                  authService.logout().then((value) =>
                                      Get.offAllNamed(Routes.homeRoute));
                                }
                              }),
                              child: TaskColumn(
                                icon: Icons.key,
                                iconBackgroundColor: LightColors.kDarkYellow,
                                title: 'Logout',
                                subtitle: 'Keluar Aplikasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
