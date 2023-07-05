import 'package:dictionary_english_word/api/word_api.dart';
import 'package:dictionary_english_word/di/di.dart';
import 'package:dictionary_english_word/models/word_model.dart';
import 'package:dictionary_english_word/pages/wordListPage/word_list_page_store.dart';
import 'package:dictionary_english_word/pages/wordPage/word_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({Key? key}) : super(key: key);

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  final ScrollController _scrollController = ScrollController();
  final WordListStore _store = getIt();
  final bool _isLoading = false;
  final WordApi wordApi = getIt<WordApi>();

  String wordSelect = '';
  List favoritesWord = [];
  List historyWord = [];
  bool isFavorited = false;

  BoxDecoration blackBorderDecoration = BoxDecoration(
    color: Colors.grey,
    border: Border.all(
      color: Colors.black,
      width: 1.0,
    ),
  );

  @override
  void initState() {
    super.initState();
    _store.getListHistory();
    _store.getListFavorites();
    _store.generateWord();
    _store.shouldReturnController.stream.listen((shouldReturn) async {
      await _store.getRandomWordFromApi();
      showPageAsPopup(context, _store.wordResult!);
    });
  }

  @override
  void dispose() {
    _store.shouldReturnController.close();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Observer(builder: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _store.textBody,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                if (_store.textBody == "Favorites")
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                        onTap: () async {
                          await _store.saveListFavorites();
                          await _store.saveListHistory();
                          showSaveConfirmationDialog(context);
                        },
                        child: const Icon(Icons.save)),
                  )
              ],
            ),
            Expanded(
              child: _store.shouldReturn == null
                  ? buildGridView(_store.wordsSelected!)
                  : _buildLoader(),
            ),
          ],
        );
      }),
    );
  }

  Widget buildGridView(List words) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 4 / 3,
      ),
      itemCount: words.length,
      itemBuilder: (context, i) {
        _store.setLoadingAtIndex(i, false);
        final word = words[i];
        return Observer(builder: (context) {
          return createCard(
            isLoader: _store.loadingStates[i],
            text: word,
            isFavorite: _store.favoritesWord!.contains(word),
            onLongPress: () {
              if (!_store.favoritesWord!.contains(word)) {
                _store.favoritesWord?.add(word);
                setState(() {});
              } else {
                _store.favoritesWord?.remove(word);
                setState(() {});
              }
            },
            onTap: () async {
              if (_store.loadingStates[i]) return;
              _store.setLoading(i, true);
              await _store.getWordApi(word.first);
              if (_store.wordResult?.results?.isNotEmpty != null) {
                await showPageAsPopup(context, _store.wordResult!);

                if (!_store.historyWord!.contains(word)) {
                  _store.historyWord?.add(word);
                }

                _store.setLoading(i, false);
              }
            },
          );
        });
      },
    );
  }

  void showSaveConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dados Salvos'),
          content: const Text('Os dados foram salvos com sucesso.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator(color: Colors.grey));
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      elevation: 0,
      shadowColor: Colors.white,
      backgroundColor: Colors.white60,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTextContainer('Word List', () {
            _store.setHistory(false);
            _store.setFavoreite(false);
            _store.setWordList(true);
            _store.getList();
          }),
          buildTextContainer('History', () {
            _store.setFavoreite(false);
            _store.setWordList(false);
            _store.setHistory(true);
            _store.getList();
          }),
          buildTextContainer('Favorites', () {
            _store.setWordList(false);
            _store.setHistory(false);
            _store.setFavoreite(true);
            _store.getList();
          }),
        ],
      ),
    );
  }

  GestureDetector buildTextContainer(String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 120,
          height: 40,
          decoration: blackBorderDecoration,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createCard(
      {required WordPair text,
      required bool isLoader,
      required bool isFavorite,
      required Function()? onTap,
      required Function()? onLongPress}) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: isLoader
                      ? _buildLoader()
                      : Text(
                          text.first,
                          style: const TextStyle(fontSize: 18),
                        ),
                ),
                if (isFavorite)
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showPageAsPopup(BuildContext context, Word wordResult) async {
    final result = await showGeneralDialog<bool>(
      barrierDismissible: false,
      context: context,
      pageBuilder: (_, __, ___) {
        return WordPage(word: wordResult);
      },
    );
    if (result != null) {
      _store.setShouldReturn(result);
    } else {
      _store.shouldReturn = null;
    }
  }
}
