import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sabico/architectures/domain/entities/UserReport.dart';
import 'package:sabico/helpers/extensions/ext_string.dart';

class ReportRemoteDataSource {
  static Future<List<UserReport>> reportList() async {
    List<UserReport> reportList = [];
    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance.collection('report').get();

    result.docs.forEach((element) async {
      final theData = element.data();
      debugPrint("Parsing: " + jsonEncode(theData));

      String report = theData["report"];
      reportList.add(UserReport(
        id: element.id,
        dateTime: DateTime.parse(theData["dateTime"]),
        name: theData["name"],
        email: theData["email"],
        phone: theData["phone"],
        className: theData["className"],
        report: report.replaceAll("\\n", "\n"),
      ));
    });

    return reportList;
  }

  static Future<void> saveReport(UserReport theReport) async {
    final databaseReference = FirebaseFirestore.instance;
    Map<String, dynamic> reportMap = theReport.toMap();
    reportMap["dateTime"] = theReport.dateTime.toTanggal("yyyy-mm-dd");

    DocumentReference ref =
        await databaseReference.collection('report').add(theReport.toMap());
  }
}
