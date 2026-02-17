part of 'specialty_bloc.dart';

abstract class SpecialtyEvent extends Equatable {
  const SpecialtyEvent();
}

class FetchSpecialties extends SpecialtyEvent {
  @override
  List<Object> get props => [];
}
