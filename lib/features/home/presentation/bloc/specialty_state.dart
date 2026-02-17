part of 'specialty_bloc.dart';

abstract class SpecialtyState extends Equatable {
  const SpecialtyState();
}

class SpecialtyInitial extends SpecialtyState {
  @override
  List<Object> get props => [];
}

class SpecialtyLoading extends SpecialtyState {
  @override
  List<Object> get props => [];
}

class SpecialtyLoaded extends SpecialtyState {
  final List<Specialty> specialties;

  const SpecialtyLoaded(this.specialties);

  @override
  List<Object> get props => [specialties];
}

class SpecialtyError extends SpecialtyState {
  final String message;

  const SpecialtyError(this.message);

  @override
  List<Object> get props => [message];
}
