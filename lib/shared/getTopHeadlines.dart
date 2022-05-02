import '../models/articleResponse.dart';
import '../services/newServices.dart';
import 'package:rxdart/rxdart.dart';

class GetTopHeadlines {
  final NewsServices _services = NewsServices();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getHeadlines() async {
    ArticleResponse response = await _services.getTopHeadlines();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getTopHeadlines = GetTopHeadlines();
