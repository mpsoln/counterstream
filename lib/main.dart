import 'dart:ffi';

import 'package:counter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  final counterBloc = CounterBloc();
  /*void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }*/
  @override
    void dispose1(){
    counterBloc.dispose1();
    super.dispose();
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
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: counterBloc.counterstream,
              initialData: 0,
              builder: (context, snapshot) {
               // if(snapshot.hasData)
                return Text(
                  
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headline4,
              );
              },
               /*Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),*/
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            //onPressed: _incrementCounter,
            onPressed: (() {
             // _counter++;
              counterBloc.eventsink.add(CounterAction.Increment);
            }),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            //onPressed: _incrementCounter,
            onPressed: (() {
             // _counter++;
              counterBloc.eventsink.add(CounterAction.Decrement);
            }),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            //onPressed: _incrementCounter,
            onPressed: (() {
             // _counter++;
              counterBloc.eventsink.add(CounterAction.Reset);
            }),
            tooltip: 'Reset',
            child: const Icon(Icons.restart_alt_rounded),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
