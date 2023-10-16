import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sabico/architectures/domain/entities/UserReport.dart';

class ReportRemoteDataSource {
  static Future<List<UserReport>> reportList() async {
    List<UserReport> reportList = [];
    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance.collection('report').get();

    result.docs.forEach((element) async {
      final theData = element.data();
      debugPrint("Parsing: " + jsonEncode(theData));

      reportList.add(UserReport(
        id: theData["id"],
        dateTime: DateTime.parse(theData["dateTime"]),
        name: theData["name"],
        email: theData["email"],
        phone: theData["phone"],
        className: theData["className"],
        report: theData["report"],
      ));
    });

    return reportList;
  }
}
