import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class SaveReportBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class SaveReportOnIdle extends SaveReportBlocState {}

class SaveReportOnStarted extends SaveReportBlocState {}

class SaveReportOnSuccess extends SaveReportBlocState {}

class SaveReportOnError extends SaveReportBlocState {
  final String errorMessage;
  SaveReportOnError({
    required this.errorMessage,
  });
}
