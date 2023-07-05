import 'package:json_annotation/json_annotation.dart';

part 'word_model.g.dart';

@JsonSerializable()
class Word {
  String? word;
  List<Result>? results;
  Syllables? syllables;
  Pronunciation? pronunciation;
  double? frequency;

  Word({
    this.word,
    this.results,
    this.syllables,
    this.pronunciation,
    this.frequency,
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
  Map<String, dynamic> toJson() => _$WordToJson(this);
}

@JsonSerializable()
class Result {
  String? definition;
  String? partOfSpeech;
  List<String>? synonyms;
  List<String>? typeOf;
  List<String>? hasTypes;
  List<String>? derivation;
  List<String>? examples;

  Result({
    this.definition,
    this.partOfSpeech,
    this.synonyms,
    this.typeOf,
    this.hasTypes,
    this.derivation,
    this.examples,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Syllables {
  int? count;
  List<String>? list;

  Syllables({
    this.count,
    this.list,
  });

  factory Syllables.fromJson(Map<String, dynamic> json) =>
      _$SyllablesFromJson(json);
  Map<String, dynamic> toJson() => _$SyllablesToJson(this);
}

@JsonSerializable()
class Pronunciation {
  String? all;

  Pronunciation({
    this.all,
  });

  factory Pronunciation.fromJson(Map<String, dynamic> json) =>
      _$PronunciationFromJson(json);
  Map<String, dynamic> toJson() => _$PronunciationToJson(this);
}
