import 'package:flutter_application_1/services/newServices.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../models/articleResponse.dart';

class GetSourceNews {
  final NewsServices _services = NewsServices();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getSourceNews(String sourceId) async {
    ArticleResponse response = await _services.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
  
}
final getSourceNews = GetSourceNews();