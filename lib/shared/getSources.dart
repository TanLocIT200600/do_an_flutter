import '../models/sourceResponse.dart';
import '../services/newServices.dart';
import 'package:rxdart/rxdart.dart';

class GetSources {
  final NewsServices _services = NewsServices();
  final BehaviorSubject<SourceResponse> _subject =
      BehaviorSubject<SourceResponse>();

  getSources() async {
    SourceResponse response = await _services.getSources();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SourceResponse> get subject => _subject;
}

final getSources = GetSources();
