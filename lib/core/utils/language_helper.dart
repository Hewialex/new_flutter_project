class LanguageHelper {
  convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'am':
        langName = "አማርኛ"; // Amharic
        break;
      case 'om':
        langName = "Afaan Oromoo"; // Oromo
        break;
      case 'so':
        langName = "Soomaali"; // Somali
        break;
      case 'ar':
        langName = "العربية"; // Arabic
        break;
      default:
        langName = "English";
    }

    return langName;
  }
}
