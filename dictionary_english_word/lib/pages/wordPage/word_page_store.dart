import 'package:mobx/mobx.dart';

part 'word_page_store.g.dart';

class WordPageStore = WordPageStoreBase with _$WordPageStore;

abstract class WordPageStoreBase with Store {
  @observable
  bool isPlaying = false;
  @observable
  double playbackPosition = 0.0;
  @observable
  double playbackDuration = 0.0;
  @action
  setAudioCompletion(playing, position) {
    isPlaying = playing;
    playbackPosition = position;
  }

  @action
  setPlay(value) => isPlaying = value;
  @action
  setAudioProgress(start, end) {
    playbackPosition = start / end;
  }
}
