import 'package:dictionary_english_word/api/word_api.dart';
import 'package:dictionary_english_word/pages/wordListPage/word_list_page_store.dart';
import 'package:dictionary_english_word/pages/wordPage/word_page_store.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<WordApi>(() => WordApi());
  getIt.registerLazySingleton<WordListStore>(() => WordListStore());
  getIt.registerLazySingleton<WordPageStore>(() => WordPageStore());
}
