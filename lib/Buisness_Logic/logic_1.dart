import 'package:event_bus/event_bus.dart';

import '../Events/text_change_event.dart';
import '../Events/OnClickEvent/on_click_event_1.dart';

class logic1 {

  final EventBus eventBus;

  logic1(this.eventBus){
    eventBus.on<OnClickEvent1>().listen((_) {
        print(" -> On Click Event 1");
        _incrementCounter();
        eventBus.fire(TextChangedEvent("Logic 1 = ${_counter}"));
      }
    );
  }


  int _counter = 0;

  void _incrementCounter() {
      _counter++;
  }


}