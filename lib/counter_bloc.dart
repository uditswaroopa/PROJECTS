import 'dart:async';
import 'counter_bloc_event.dart';

class Counter {
  int _counter = 0;

  //this is controller, just like tap controll flow of water this control flow of data
  final _stateController = StreamController<int>();

  //this controller is used to take event as input and maps it to state
  StreamSink<int> get _inCounter => _stateController.sink;

  //this controller is used to output state as Output
  Stream<int> get outCounter => _stateController.stream;

  //Event Controller
  final _counterEventController = StreamController<CounterEvent>();

  //this controller is used to listen data from UI
  Sink<CounterEvent> get counterEvent => _counterEventController.sink;

  //This is Constructor
  Counter() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _stateController.close();
  }
}
