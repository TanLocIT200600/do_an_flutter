import '../models/articleResponse.dart';
import '../services/newServices.dart';
import 'package:rxdart/rxdart.dart';

class GetHotNews {
  final NewsServices _services = NewsServices();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getHotNews() async {
    ArticleResponse response = await _services.getHotNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getHotNews = GetHotNews();
