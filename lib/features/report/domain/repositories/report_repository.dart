import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/report_stats.dart';

abstract class ReportRepository {
  // Lấy báo cáo theo khoảng thời gian (from - to)
  // Nếu xem theo Ngày: from = to = ngày đó (startOfDay - endOfDay)
  // Nếu xem theo Tháng: from = đầu tháng, to = cuối tháng
  Future<Either<Failure, ReportStats>> getReport(DateTime from, DateTime to);
}
