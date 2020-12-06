import 'dart:async';

class CounterBloc {
  //this is stream Controller
  final _stateStreamController = StreamController<int>();

  //this is used to take event as Input
  StreamSink<int> get counterSink => _stateStreamController.sink;

  //this is used to throw state as output
  Stream<int> get counterStream => _stateStreamController.stream;

  //close the stream, so that memory leaks can be prevented
  void dispose() {
    _stateStreamController.close();
  }
}
