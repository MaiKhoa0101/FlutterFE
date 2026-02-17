import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/specialty.dart';
import '../../domain/repositories/specialty_repository.dart';

part 'specialty_event.dart';
part 'specialty_state.dart';

@injectable
class SpecialtyBloc extends Bloc<SpecialtyEvent, SpecialtyState> {
  final SpecialtyRepository repository;

  SpecialtyBloc(this.repository) : super(SpecialtyInitial()) {
    on<FetchSpecialties>((event, emit) async {
      emit(SpecialtyLoading());
      final result = await repository.getSpecialties();
      result.fold(
        (failure) => emit(SpecialtyError(failure.message)),
        (specialties) => emit(SpecialtyLoaded(specialties)),
      );
    });
  }
}
