part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();
}

class ReportInitial extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoading extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoaded extends ReportState {
  final ReportStats stats;
  final String periodLabel; // Ví dụ: "Hôm nay", "Tháng 2/2026"

  const ReportLoaded(this.stats, this.periodLabel);

  @override
  List<Object> get props => [stats, periodLabel];
}

class ReportError extends ReportState {
  final String message;

  const ReportError(this.message);

  @override
  List<Object> get props => [message];
}
