import 'dart:async';
import 'dart:math';

import 'package:dictionary_english_word/api/word_api.dart';
import 'package:dictionary_english_word/di/di.dart';
import 'package:dictionary_english_word/models/word_model.dart';
import 'package:english_words/english_words.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'word_list_page_store.g.dart';

class WordListStore = WordListStoreBase with _$WordListStore;

abstract class WordListStoreBase with Store {
  final WordApi wordApi = getIt<WordApi>();

  @observable
  String wordSelect = '';

  @observable
  String textBody = "WordList";

  @observable
  Word? wordResult;

  @observable
  List<WordPair>? favoritesWord = [];

  @observable
  List<WordPair>? historyWord = [];

  @observable
  List<WordPair>? wordPairs;

  @observable
  List<WordPair>? wordsSelected = [];

  @observable
  bool isFavorite = false;

  @observable
  bool isLoading = false;

  @observable
  bool isWordList = true;

  @observable
  bool isHistory = false;

  @observable
  bool? shouldReturn;

  @observable
  ObservableList<bool> loadingStates = ObservableList<bool>();

  @observable
  StreamController<bool> shouldReturnController = StreamController<bool>();

  @action
  setFavoreite(value) => isFavorite = value;

  @action
  setHistory(value) => isHistory = value;

  @action
  setWordList(value) => isWordList = value;

  @action
  setLoading(int index, bool value) {
    loadingStates[index] = value;
  }

  @action
  dynamic getList() {
    if (isWordList) {
      wordsSelected = wordPairs;
      textBody = "WordList";
    } else if (isHistory) {
      wordsSelected = historyWord;
      textBody = "History";
    } else {
      wordsSelected = favoritesWord;
      textBody = "Favorites";
    }
  }

  @action
  getWordApi(word) async {
    wordResult = await wordApi.fetchWords(word);
  }

  @action
  generateWord() {
    wordsSelected = wordPairs = generateWordPairs().take(1000).toList();
  }

  @action
  getRandomWordFromApi() async {
    final randomIndex = Random().nextInt(wordsSelected!.length);
    final randomWord = wordsSelected?[randomIndex].first;
    wordResult = await wordApi.fetchWords(randomWord!);
  }

  @action
  void setLoadingAtIndex(int index, bool value) {
    if (index >= loadingStates.length) {
      loadingStates.addAll(List.generate(
        index - loadingStates.length + 1,
        (_) => value,
      ));
    }
  }

  @action
  void setShouldReturn(bool value) {
    shouldReturn = value;
    shouldReturnController.add(value);
  }

  Future<void> saveListFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'Favorites', wordPairListToStringList(favoritesWord));
  }

  Future<void> saveListHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('History', wordPairListToStringList(historyWord));
  }

  getListHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? myList = prefs.getStringList('History');
    historyWord = stringListToWordPairList(myList ?? []);
  }

  getListFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? myList = prefs.getStringList('Favorites');
    favoritesWord = stringListToWordPairList(myList ?? []);
  }

  List<String> wordPairListToStringList(List<WordPair>? wordPairList) {
    return wordPairList!
        .map((wordPair) => '${wordPair.first} ${wordPair.second}')
        .toList();
  }

  List<WordPair> stringListToWordPairList(List<String>? stringList) {
    return stringList!.map((string) {
      final parts = string.split(' ');
      return WordPair(parts[0], parts[1]);
    }).toList();
  }
}
