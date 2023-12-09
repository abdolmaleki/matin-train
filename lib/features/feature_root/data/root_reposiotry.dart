abstract class RootRepository {
  Future<void> saveAppLanguages(String lang);
  Future<String> getAppLanguage();
}