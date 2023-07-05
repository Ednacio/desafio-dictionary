// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordListStore on WordListStoreBase, Store {
  late final _$wordSelectAtom =
      Atom(name: 'WordListStoreBase.wordSelect', context: context);

  @override
  String get wordSelect {
    _$wordSelectAtom.reportRead();
    return super.wordSelect;
  }

  @override
  set wordSelect(String value) {
    _$wordSelectAtom.reportWrite(value, super.wordSelect, () {
      super.wordSelect = value;
    });
  }

  late final _$textBodyAtom =
      Atom(name: 'WordListStoreBase.textBody', context: context);

  @override
  String get textBody {
    _$textBodyAtom.reportRead();
    return super.textBody;
  }

  @override
  set textBody(String value) {
    _$textBodyAtom.reportWrite(value, super.textBody, () {
      super.textBody = value;
    });
  }

  late final _$wordResultAtom =
      Atom(name: 'WordListStoreBase.wordResult', context: context);

  @override
  Word? get wordResult {
    _$wordResultAtom.reportRead();
    return super.wordResult;
  }

  @override
  set wordResult(Word? value) {
    _$wordResultAtom.reportWrite(value, super.wordResult, () {
      super.wordResult = value;
    });
  }

  late final _$favoritesWordAtom =
      Atom(name: 'WordListStoreBase.favoritesWord', context: context);

  @override
  List<WordPair>? get favoritesWord {
    _$favoritesWordAtom.reportRead();
    return super.favoritesWord;
  }

  @override
  set favoritesWord(List<WordPair>? value) {
    _$favoritesWordAtom.reportWrite(value, super.favoritesWord, () {
      super.favoritesWord = value;
    });
  }

  late final _$historyWordAtom =
      Atom(name: 'WordListStoreBase.historyWord', context: context);

  @override
  List<WordPair>? get historyWord {
    _$historyWordAtom.reportRead();
    return super.historyWord;
  }

  @override
  set historyWord(List<WordPair>? value) {
    _$historyWordAtom.reportWrite(value, super.historyWord, () {
      super.historyWord = value;
    });
  }

  late final _$wordPairsAtom =
      Atom(name: 'WordListStoreBase.wordPairs', context: context);

  @override
  List<WordPair>? get wordPairs {
    _$wordPairsAtom.reportRead();
    return super.wordPairs;
  }

  @override
  set wordPairs(List<WordPair>? value) {
    _$wordPairsAtom.reportWrite(value, super.wordPairs, () {
      super.wordPairs = value;
    });
  }

  late final _$wordsSelectedAtom =
      Atom(name: 'WordListStoreBase.wordsSelected', context: context);

  @override
  List<WordPair>? get wordsSelected {
    _$wordsSelectedAtom.reportRead();
    return super.wordsSelected;
  }

  @override
  set wordsSelected(List<WordPair>? value) {
    _$wordsSelectedAtom.reportWrite(value, super.wordsSelected, () {
      super.wordsSelected = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: 'WordListStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'WordListStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isWordListAtom =
      Atom(name: 'WordListStoreBase.isWordList', context: context);

  @override
  bool get isWordList {
    _$isWordListAtom.reportRead();
    return super.isWordList;
  }

  @override
  set isWordList(bool value) {
    _$isWordListAtom.reportWrite(value, super.isWordList, () {
      super.isWordList = value;
    });
  }

  late final _$isHistoryAtom =
      Atom(name: 'WordListStoreBase.isHistory', context: context);

  @override
  bool get isHistory {
    _$isHistoryAtom.reportRead();
    return super.isHistory;
  }

  @override
  set isHistory(bool value) {
    _$isHistoryAtom.reportWrite(value, super.isHistory, () {
      super.isHistory = value;
    });
  }

  late final _$shouldReturnAtom =
      Atom(name: 'WordListStoreBase.shouldReturn', context: context);

  @override
  bool? get shouldReturn {
    _$shouldReturnAtom.reportRead();
    return super.shouldReturn;
  }

  @override
  set shouldReturn(bool? value) {
    _$shouldReturnAtom.reportWrite(value, super.shouldReturn, () {
      super.shouldReturn = value;
    });
  }

  late final _$loadingStatesAtom =
      Atom(name: 'WordListStoreBase.loadingStates', context: context);

  @override
  ObservableList<bool> get loadingStates {
    _$loadingStatesAtom.reportRead();
    return super.loadingStates;
  }

  @override
  set loadingStates(ObservableList<bool> value) {
    _$loadingStatesAtom.reportWrite(value, super.loadingStates, () {
      super.loadingStates = value;
    });
  }

  late final _$shouldReturnControllerAtom =
      Atom(name: 'WordListStoreBase.shouldReturnController', context: context);

  @override
  StreamController<bool> get shouldReturnController {
    _$shouldReturnControllerAtom.reportRead();
    return super.shouldReturnController;
  }

  @override
  set shouldReturnController(StreamController<bool> value) {
    _$shouldReturnControllerAtom
        .reportWrite(value, super.shouldReturnController, () {
      super.shouldReturnController = value;
    });
  }

  late final _$getWordApiAsyncAction =
      AsyncAction('WordListStoreBase.getWordApi', context: context);

  @override
  Future getWordApi(dynamic word) {
    return _$getWordApiAsyncAction.run(() => super.getWordApi(word));
  }

  late final _$getRandomWordFromApiAsyncAction =
      AsyncAction('WordListStoreBase.getRandomWordFromApi', context: context);

  @override
  Future getRandomWordFromApi() {
    return _$getRandomWordFromApiAsyncAction
        .run(() => super.getRandomWordFromApi());
  }

  late final _$WordListStoreBaseActionController =
      ActionController(name: 'WordListStoreBase', context: context);

  @override
  dynamic setFavoreite(dynamic value) {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.setFavoreite');
    try {
      return super.setFavoreite(value);
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHistory(dynamic value) {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.setHistory');
    try {
      return super.setHistory(value);
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWordList(dynamic value) {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.setWordList');
    try {
      return super.setWordList(value);
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(int index, bool value) {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.setLoading');
    try {
      return super.setLoading(index, value);
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getList() {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic generateWord() {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.generateWord');
    try {
      return super.generateWord();
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingAtIndex(int index, bool value) {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.setLoadingAtIndex');
    try {
      return super.setLoadingAtIndex(index, value);
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShouldReturn(bool value) {
    final _$actionInfo = _$WordListStoreBaseActionController.startAction(
        name: 'WordListStoreBase.setShouldReturn');
    try {
      return super.setShouldReturn(value);
    } finally {
      _$WordListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wordSelect: ${wordSelect},
textBody: ${textBody},
wordResult: ${wordResult},
favoritesWord: ${favoritesWord},
historyWord: ${historyWord},
wordPairs: ${wordPairs},
wordsSelected: ${wordsSelected},
isFavorite: ${isFavorite},
isLoading: ${isLoading},
isWordList: ${isWordList},
isHistory: ${isHistory},
shouldReturn: ${shouldReturn},
loadingStates: ${loadingStates},
shouldReturnController: ${shouldReturnController}
    ''';
  }
}
