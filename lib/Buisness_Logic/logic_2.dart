import 'package:event_bus/event_bus.dart';

import '../Events/text_change_event.dart';
import '../Events/OnClickEvent/on_click_event_2.dart';

class logic2 {

  final EventBus eventBus;

  logic2(this.eventBus) {
    eventBus.on<OnClickEvent2>().listen((_) {
      print(" -> On Click Event 2");
      _decrementCounter();
      eventBus.fire(TextChangedEvent("Logic 2 = ${_counter}"));
    }
    );
  }


  int _counter = 0;

  void _decrementCounter() {
    _counter++;
  }
}