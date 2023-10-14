import 'package:flutter/material.dart';
import 'package:sabico/helpers/extensions/ext_string.dart';

class ReportContainer extends StatelessWidget {
  final String subtitle;
  final Color boxColor;
  final DateTime dateTime;

  ReportContainer({
    required this.dateTime,
    required this.subtitle,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Isi Laporan",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            dateTime.toTanggal("dd MMMM yyyy"),
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
