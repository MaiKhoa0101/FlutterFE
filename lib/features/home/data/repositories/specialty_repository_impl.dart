import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/specialty.dart';
import '../../domain/repositories/specialty_repository.dart';
import '../datasources/home_remote_data_source.dart';

@Injectable(as: SpecialtyRepository)
class SpecialtyRepositoryImpl implements SpecialtyRepository {
  final HomeRemoteDataSource remoteDataSource;

  SpecialtyRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Specialty>>> getSpecialties() async {
    try {
      final models = await remoteDataSource.getSpecialties();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch specialties'));
    }
  }
}
