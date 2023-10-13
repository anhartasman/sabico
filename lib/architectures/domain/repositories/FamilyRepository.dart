import 'package:sabico/architectures/domain/entities/FamilyEvaluation.dart';
import 'package:sabico/architectures/domain/entities/FamilyMember.dart';

abstract class FamilyRepository {
  Future<List<FamilyMember>> memberList();
  Future<void> saveMember(FamilyMember theMember);
  Future<FamilyMember> memberDetail(int id);
  Future<void> saveEvaluation(FamilyEvaluation theEvaluation);
  Future<List<FamilyEvaluation>> evaluationResult(
    String firstDate,
    String lastDate,
    int childId,
  );
}
