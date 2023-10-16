// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserReport {
  final String id;
  final DateTime dateTime;
  final String name;
  final String email;
  final String phone;
  final String className;
  final String report;
  const UserReport({
    required this.id,
    required this.dateTime,
    required this.name,
    required this.email,
    required this.phone,
    required this.className,
    required this.report,
  });

  UserReport copyWith({
    String? id,
    DateTime? dateTime,
    String? name,
    String? email,
    String? phone,
    String? className,
    String? report,
  }) {
    return UserReport(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      className: className ?? this.className,
      report: report ?? this.report,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'name': name,
      'email': email,
      'phone': phone,
      'className': className,
      'report': report,
    };
  }

  factory UserReport.fromMap(Map<String, dynamic> map) {
    return UserReport(
      id: map['id'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      className: map['className'] as String,
      report: map['report'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserReport.fromJson(String source) =>
      UserReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserReport(id: $id, dateTime: $dateTime, name: $name, email: $email, phone: $phone, className: $className, report: $report)';
  }

  @override
  bool operator ==(covariant UserReport other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dateTime == dateTime &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.className == className &&
        other.report == report;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateTime.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        className.hashCode ^
        report.hashCode;
  }
}
