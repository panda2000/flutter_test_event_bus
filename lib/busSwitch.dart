import 'package:event_bus/event_bus.dart';
import './Events/SwitchRuleEvent.dart';

import './Events/OnClickEvent/on_click_event.dart';
import './Events/OnClickEvent/on_click_event_1.dart';
import './Events/OnClickEvent/on_click_event_2.dart';

class busSwitch {
  final eventBus ;

  String rule = "1";

  busSwitch(this.eventBus){
    print(" Create Bus Switch ");
    eventBus.on<onClickEvent>().listen((_) {
        print(" -> On Click Event ");
        print(" Switch Rule = ${rule}");

        if (rule == "1") {
          print(" Switch send -> On Click Event 1");
          eventBus.fire(OnClickEvent1());
        } else {
          print(" Switch send -> On Click Event 2");
          eventBus.fire(OnClickEvent2());
        }

      }
    );


    eventBus.on<SwitchRuleEvent>().listen((SwitchRuleEvent event) {
        print(" -> SwitchruleEvent ");
        rule = "$event.rule";
        print(" Switch Rule = ${rule}");
      }
    );
  }


}