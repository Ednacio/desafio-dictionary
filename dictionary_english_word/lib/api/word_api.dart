import 'dart:convert';

import 'package:dictionary_english_word/models/word_model.dart';
import 'package:http/http.dart' as http;

class WordApi {
  Future<Word> fetchWords(String word) async {
    const apiUrl = 'https://www.wordsapi.com/mashape/words';
    final url =
        "$apiUrl/$word?when=2023-06-25T18:28:59.917Z&encrypted=8cfdb189e722959be89407bee758bcb1aeb5240939fe90b8";

    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final words = Word.fromJson(data);

      return words;
    } else {
      throw Exception('Failed to fetch words');
    }
  }
}
