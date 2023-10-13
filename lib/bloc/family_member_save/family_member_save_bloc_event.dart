import 'package:sabico/architectures/domain/entities/FamilyMember.dart';

abstract class FamilyMemberSaveBlocEvent {}

class FamilyMemberSaveBlocStart extends FamilyMemberSaveBlocEvent {
  final FamilyMember theMember;
  FamilyMemberSaveBlocStart(this.theMember);
}
