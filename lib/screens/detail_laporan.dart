import 'package:flutter/material.dart';
import 'package:sabico/dates_list.dart';
import 'package:sabico/theme/colors/light_colors.dart';
import 'package:sabico/widgets/ReportContainer.dart';
import 'package:sabico/widgets/calendar_dates.dart';
import 'package:sabico/widgets/task_container.dart';
import 'package:sabico/screens/create_new_task_page.dart';
import 'package:sabico/widgets/back_button.dart';

class detail_laporan extends StatelessWidget {
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Udin Senja',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'udin@yahoo.com',
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
                      '08788384431',
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
                    'Kelas 7 A',
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
                dateTime: DateTime.now(),
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut congue enim. Proin quis ante tempus dui blandit euismod sed et nisl. Nulla facilisis, elit quis interdum tempus, ipsum lacus dignissim ex, in tincidunt magna ante in nunc. Vestibulum augue sem, ullamcorper sit amet vehicula vel, posuere luctus lacus. Fusce convallis feugiat nibh, in efficitur arcu elementum quis. Vestibulum consectetur turpis sit amet justo hendrerit, at suscipit sem sollicitudin. Nam iaculis aliquet dignissim. Phasellus sed vulputate dolor, id lacinia massa. Pellentesque eu facilisis leo. ',
                boxColor: LightColors.kLightYellow2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
