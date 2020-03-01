import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

import './Events/text_change_event.dart';
import './Events/OnClickEvent/on_click_event.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.eventBus}) : super(key: key);
  final String title;
  final EventBus eventBus;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "0";

  _MyHomePageState(){
    widget.eventBus.on<TextChangedEvent>().listen((TextChangedEvent event) {
      setState(() {
        message = event.text;
      });
      print("Text changed to ${event.text}");
    }
    );
  }


  void _onClickEvent () {
    print("Send -> On Click Event ");
    widget.eventBus.fire(onClickEvent());
    widget.eventBus.fire(TextChangedEvent("Test"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickEvent,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}