import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import './Buisness_Logic/logic_1.dart';
import './Buisness_Logic/logic_2.dart';

import './my_home_page.dart';
import 'busSwitch.dart';

void main() {
  final eventBus = EventBus();
  busSwitch(eventBus);
  logic1(eventBus);
  logic2(eventBus);
  runApp(MyApp(eventBus));
}

class MyApp extends StatelessWidget {
  final EventBus eventBus;
  MyApp(this.eventBus);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: 'Flutter Demo Home Page',
          eventBus: eventBus,
        ),
    );
  }
}


