import 'package:dictionary_english_word/di/di.dart';
import 'package:dictionary_english_word/models/word_model.dart';
import 'package:dictionary_english_word/pages/wordPage/word_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordPage extends StatefulWidget {
  final Word word;
  const WordPage({
    Key? key,
    required this.word,
  }) : super(key: key);

  @override
  State<WordPage> createState() => _WordPageState();
}

final WordPageStore _store = getIt();
bool shouldReturn = false;
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage('en-US');
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.1);
  await flutterTts.speak(text);
}

class _WordPageState extends State<WordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white60,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            customContainer(),
            const SizedBox(height: 20),
            audioPlayerWidget(),
            const SizedBox(height: 40),
            buildMeaningsWidget(),
            const SizedBox(height: 80),
            buttonContainer(
              onBack: () {
                shouldReturn = false;
                Navigator.pop(context, shouldReturn);
              },
              onNext: () {
                shouldReturn = true;
                Navigator.pop(context, shouldReturn);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.grey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.word.word ?? "",
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(
                      widget.word.pronunciation?.all ?? "",
                      style: const TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),
            // Add your desired widget below this line
          ],
        ),
      ),
    );
  }

  buttonContainer({required Function() onBack, required Function() onNext}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customElevateButton(onPressed: onBack, text: 'Voltar'),
          customElevateButton(onPressed: onNext, text: 'Proximo'),
        ],
      ),
    );
  }

  Widget customElevateButton(
      {required Function() onPressed, required String text}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey, // Set t
        minimumSize: const Size(160, 50), // Set the min
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildMeaningsWidget() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meanings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 0,
                    child: Text(
                      "${widget.word.results?.first.partOfSpeech} - ",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.word.results?.first.examples?.first ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget audioPlayerWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  await playAudio();
                },
                child: const Icon(Icons.play_arrow, size: 50)),
            const SizedBox(width: 10),
            SizedBox(
              width: 250,
              child: Observer(builder: (context) {
                return LinearProgressIndicator(
                  value: _store.playbackPosition,
                  minHeight: 5,
                  backgroundColor: Colors.grey,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }

  playAudio() {
    _store.setPlay(true);
    flutterTts
        .setProgressHandler((String text, int start, int end, String word) {
      _store.setAudioProgress(start, end);
    });
    flutterTts.setCompletionHandler(() {
      _store.setAudioCompletion(false, 0.0);
    });
    speak(widget.word.word ?? "");
    _store.setAudioCompletion(false, 1.0);
  }
}
