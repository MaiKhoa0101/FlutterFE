import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/specialty.dart';

abstract class SpecialtyRepository {
  Future<Either<Failure, List<Specialty>>> getSpecialties();
}
