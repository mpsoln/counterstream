import 'dart:async';
enum CounterAction{
  Increment,
  Decrement,
  Reset,
}
//from codeX
//from website:https://www.youtube.com/watch?v=jIoWkct6_EM&t=881s   
class CounterBloc{
  late int counter;
  final _stateStreamController = StreamController<int>.broadcast();
  StreamSink<int> get countersink  => _stateStreamController.sink;
  Stream<int> get counterstream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventsink  => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc(){
    counter = 0;
    counterstream.listen((event) { });
    eventStream.listen((event) { 
      if(event == CounterAction.Increment)counter++;
      else if(event == CounterAction.Decrement)counter--;
      else if(event == CounterAction.Reset)counter=0;
      countersink.add(counter);
    });
  }
  void dispose1(){
    _stateStreamController.close();
     _eventStreamController.close();
  }
}