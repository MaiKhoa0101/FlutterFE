import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/report_stats.dart';
import '../../domain/repositories/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository repository;

  ReportBloc(this.repository) : super(ReportInitial()) {
    on<LoadReport>(_onLoadReport);
    on<LoadDailyReport>(_onLoadDailyReport);
    on<LoadMonthlyReport>(_onLoadMonthlyReport);
  }

  Future<void> _onLoadDailyReport(LoadDailyReport event, Emitter<ReportState> emit) async {
    final startOfDay = DateTime(event.date.year, event.date.month, event.date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
    
    // Label
    final label = DateFormat('dd/MM/yyyy').format(event.date);
    
    await _fetchReport(startOfDay, endOfDay, "Ngày $label", emit);
  }

  Future<void> _onLoadMonthlyReport(LoadMonthlyReport event, Emitter<ReportState> emit) async {
    final startOfMonth = DateTime(event.month.year, event.month.month, 1);
    final endOfMonth = DateTime(event.month.year, event.month.month + 1, 1).subtract(const Duration(milliseconds: 1));
    
    final label = DateFormat('MM/yyyy').format(event.month);
    
    await _fetchReport(startOfMonth, endOfMonth, "Tháng $label", emit);
  }

  Future<void> _onLoadReport(LoadReport event, Emitter<ReportState> emit) async {
    await _fetchReport(event.from, event.to, "Custom", emit);
  }

  Future<void> _fetchReport(DateTime from, DateTime to, String label, Emitter<ReportState> emit) async {
    emit(ReportLoading());
    final result = await repository.getReport(from, to);
    result.fold(
      (failure) => emit(ReportError(failure.message)),
      (stats) => emit(ReportLoaded(stats, label)),
    );
  }
}
