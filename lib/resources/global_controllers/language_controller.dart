import '../helpers/all_imports.dart';

class LanguageController extends GetxController {
  static const String _arabicLangValue = 'ar';
  static const String _englishLangValue = 'en';
  String selectedLanguageCode = _arabicLangValue;
  late List<LanguageModel> languageList;

  String get selectedLanguageLabel {
    return languageList.firstWhere((e) {
      return e.code == selectedLanguageCode;
    }).name;
  }

  void initLanguageList() {
    languageList = [
      LanguageModel(
        code: _arabicLangValue,
        name: localizations.arabic,
      ),
      LanguageModel(
        code: _englishLangValue,
        name: localizations.english,
      ),
    ];
  }

  void changeLanguage(String code) {
    Get.updateLocale(Locale(code));
    selectedLanguageCode = code;
    update();
    _setLanguage(selectedLanguageCode);
  }

  static Future<void> _setLanguage(String value) async {
    await SharedPrefsService().setLanguage(value);
  }

  Locale getLocale() {
    selectedLanguageCode =
        SharedPrefsService().getLanguage() ?? _englishLangValue;
    return Locale(selectedLanguageCode);
  }
}
