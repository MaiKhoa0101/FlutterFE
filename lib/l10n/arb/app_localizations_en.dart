// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'HelloDoc';

  @override
  String get welcome_message => 'Welcome to HelloDoc';

  @override
  String get api_test_button => 'Test API Connection';

  @override
  String get clean_project_success => 'Project cleaned successfully!';
}
