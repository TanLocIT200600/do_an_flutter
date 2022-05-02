import 'package:flutter_application_1/services/newServices.dart';
import 'package:rxdart/rxdart.dart';

import '../models/articleResponse.dart';

class Search {
  final NewsServices _services = NewsServices();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  search(String value) async {
    ArticleResponse response = await _services.search(value);
    _subject.sink.add(response);
  }
  
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
  
}
final search = Search();