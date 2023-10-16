import 'package:flutter/material.dart';
import 'package:sabico/architectures/domain/entities/UserReport.dart';
import 'package:sabico/dates_list.dart';
import 'package:sabico/theme/colors/light_colors.dart';
import 'package:sabico/widgets/ReportContainer.dart';
import 'package:sabico/widgets/calendar_dates.dart';
import 'package:sabico/widgets/task_container.dart';
import 'package:sabico/screens/create_new_task_page.dart';
import 'package:sabico/widgets/back_button.dart';

class detail_laporan extends StatelessWidget {
  final UserReport theReport;
  const detail_laporan(this.theReport, {super.key});

  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: ListView(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Text(
                theReport.name,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    theReport.email,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      theReport.phone,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewTaskPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kelas ' + theReport.className,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ReportContainer(
                dateTime: theReport.dateTime,
                subtitle: theReport.report,
                boxColor: LightColors.kLightYellow2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
