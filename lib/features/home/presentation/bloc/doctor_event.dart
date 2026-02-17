part of 'doctor_bloc.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();
}

class FetchDoctors extends DoctorEvent {
  const FetchDoctors();

  @override
  List<Object> get props => [];
}
