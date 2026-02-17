import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/doctor.dart';

abstract class DoctorRepository {
  Future<Either<Failure, List<Doctor>>> getDoctors();
  Future<Either<Failure, Doctor>> getDoctorById(String id);
}
