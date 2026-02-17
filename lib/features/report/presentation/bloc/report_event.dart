part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class LoadReport extends ReportEvent {
  final DateTime from;
  final DateTime to;

  const LoadReport(this.from, this.to);

  @override
  List<Object> get props => [from, to];
}

class LoadDailyReport extends ReportEvent {
  final DateTime date;
  const LoadDailyReport(this.date);
  @override
  List<Object> get props => [date];
}

class LoadMonthlyReport extends ReportEvent {
  final DateTime month;
  const LoadMonthlyReport(this.month);
  @override
  List<Object> get props => [month];
}
