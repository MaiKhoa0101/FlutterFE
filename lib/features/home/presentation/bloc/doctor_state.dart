part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();
}

class DoctorInitial extends DoctorState {
  @override
  List<Object> get props => [];
}

class DoctorLoading extends DoctorState {
  @override
  List<Object> get props => [];
}

class DoctorLoaded extends DoctorState {
  final List<Doctor> doctors;

  const DoctorLoaded(this.doctors);

  @override
  List<Object> get props => [doctors];
}

class DoctorError extends DoctorState {
  final String message;

  const DoctorError(this.message);

  @override
  List<Object> get props => [message];
}
