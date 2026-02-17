// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get app_name => 'HelloDoc';

  @override
  String get welcome_message => 'Chào mừng đến với HelloDoc';

  @override
  String get api_test_button => 'Thử kết nối API';

  @override
  String get clean_project_success => 'Dự án đã được làm sạch!';
}
