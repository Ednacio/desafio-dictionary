// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      word: json['word'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      syllables: json['syllables'] == null
          ? null
          : Syllables.fromJson(json['syllables'] as Map<String, dynamic>),
      pronunciation: json['pronunciation'] == null
          ? null
          : Pronunciation.fromJson(
              json['pronunciation'] as Map<String, dynamic>),
      frequency: (json['frequency'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'word': instance.word,
      'results': instance.results,
      'syllables': instance.syllables,
      'pronunciation': instance.pronunciation,
      'frequency': instance.frequency,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      definition: json['definition'] as String?,
      partOfSpeech: json['partOfSpeech'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      typeOf:
          (json['typeOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hasTypes: (json['hasTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      derivation: (json['derivation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'definition': instance.definition,
      'partOfSpeech': instance.partOfSpeech,
      'synonyms': instance.synonyms,
      'typeOf': instance.typeOf,
      'hasTypes': instance.hasTypes,
      'derivation': instance.derivation,
      'examples': instance.examples,
    };

Syllables _$SyllablesFromJson(Map<String, dynamic> json) => Syllables(
      count: json['count'] as int?,
      list: (json['list'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SyllablesToJson(Syllables instance) => <String, dynamic>{
      'count': instance.count,
      'list': instance.list,
    };

Pronunciation _$PronunciationFromJson(Map<String, dynamic> json) =>
    Pronunciation(
      all: json['all'] as String?,
    );

Map<String, dynamic> _$PronunciationToJson(Pronunciation instance) =>
    <String, dynamic>{
      'all': instance.all,
    };
