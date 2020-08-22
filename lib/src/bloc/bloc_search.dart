import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../provider/bloc_provider.dart';

// class Bloc extends Object with Validators
class BlocSearch extends BlocBase {

  final _text = new BehaviorSubject<String>();
  Stream<String> get text => _text.stream;
  Function(String) get sinkText => _text.sink.add;
  String getText() => _text.value;

  // Clean up or Close Stream
  @override
  dispose(){
    _text.close();
  }
}
