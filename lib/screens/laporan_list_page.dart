import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabico/screens/detail_laporan.dart';
import 'package:sabico/screens/evaluation_child_page.dart';
import 'package:sabico/screens/read_penggunaan_gadget.dart';
import 'package:sabico/screens/read_tips_solusi.dart';
import 'package:sabico/theme/colors/light_colors.dart';
import 'package:sabico/widgets/report_item.dart';
import 'package:sabico/widgets/task_column.dart';
import 'package:sabico/widgets/top_container.dart';

class laporan_list_page extends StatelessWidget {
  const laporan_list_page({super.key});

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
      backgroundColor: Color(0xFFFDE5D4),
      appBar: AppBar(
        title: const Text("Daftar Laporan"),
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
      ), //A
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
                        children: <Widget>[
                          InkWell(
                            onTap: () => Get.to(detail_laporan()),
                            child: report_item(
                              name: 'Udin Senja',
                              email: 'udinaja@yahoo.com',
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: report_item(
                              name: 'Udin',
                              email: 'udinaja@yahoo.com',
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: report_item(
                              name: 'Udin',
                              email: 'udinaja@yahoo.com',
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
