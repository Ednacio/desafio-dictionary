// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordPageStore on WordPageStoreBase, Store {
  late final _$isPlayingAtom =
      Atom(name: 'WordPageStoreBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$playbackPositionAtom =
      Atom(name: 'WordPageStoreBase.playbackPosition', context: context);

  @override
  double get playbackPosition {
    _$playbackPositionAtom.reportRead();
    return super.playbackPosition;
  }

  @override
  set playbackPosition(double value) {
    _$playbackPositionAtom.reportWrite(value, super.playbackPosition, () {
      super.playbackPosition = value;
    });
  }

  late final _$playbackDurationAtom =
      Atom(name: 'WordPageStoreBase.playbackDuration', context: context);

  @override
  double get playbackDuration {
    _$playbackDurationAtom.reportRead();
    return super.playbackDuration;
  }

  @override
  set playbackDuration(double value) {
    _$playbackDurationAtom.reportWrite(value, super.playbackDuration, () {
      super.playbackDuration = value;
    });
  }

  late final _$WordPageStoreBaseActionController =
      ActionController(name: 'WordPageStoreBase', context: context);

  @override
  dynamic setAudioCompletion(dynamic playing, dynamic position) {
    final _$actionInfo = _$WordPageStoreBaseActionController.startAction(
        name: 'WordPageStoreBase.setAudioCompletion');
    try {
      return super.setAudioCompletion(playing, position);
    } finally {
      _$WordPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlay(dynamic value) {
    final _$actionInfo = _$WordPageStoreBaseActionController.startAction(
        name: 'WordPageStoreBase.setPlay');
    try {
      return super.setPlay(value);
    } finally {
      _$WordPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAudioProgress(dynamic start, dynamic end) {
    final _$actionInfo = _$WordPageStoreBaseActionController.startAction(
        name: 'WordPageStoreBase.setAudioProgress');
    try {
      return super.setAudioProgress(start, end);
    } finally {
      _$WordPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
playbackPosition: ${playbackPosition},
playbackDuration: ${playbackDuration}
    ''';
  }
}
