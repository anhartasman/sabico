import 'package:flutter/material.dart';
import 'package:sabico/theme/colors/light_colors.dart';

class report_item extends StatelessWidget {
  final String name;
  final String email;
  report_item({
    required this.name,
    required this.email,
  });
  @override
  Widget build(BuildContext context) {
    final textColor = Color(0xFF445D48);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: Color(0xFFD6CC99),
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(
              color: textColor,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "udinaja@yahoo.com",
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                ),
              ),
              Text(
                "08 Okt 2023",
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
