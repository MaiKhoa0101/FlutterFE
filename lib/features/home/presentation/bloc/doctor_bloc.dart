import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

@injectable
class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository repository;

  DoctorBloc(this.repository) : super(DoctorInitial()) {
    on<FetchDoctors>(_onFetchDoctors);
  }

  Future<void> _onFetchDoctors(FetchDoctors event, Emitter<DoctorState> emit) async {
    emit(DoctorLoading());
    final result = await repository.getDoctors();
    result.fold(
      (failure) => emit(DoctorError(failure.message)),
      (doctors) => emit(DoctorLoaded(doctors)),
    );
  }
}
