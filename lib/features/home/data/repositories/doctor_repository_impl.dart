import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/home_remote_data_source.dart';

@Injectable(as: DoctorRepository)
class DoctorRepositoryImpl implements DoctorRepository {
  final HomeRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Doctor>>> getDoctors() async {
    try {
      final models = await remoteDataSource.getDoctors();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch doctors'));
    }
  }

  @override
  Future<Either<Failure, Doctor>> getDoctorById(String id) async {
    try {
      final model = await remoteDataSource.getDoctorById(id);
      return Right(model.toEntity());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch doctor'));
    }
  }
}
