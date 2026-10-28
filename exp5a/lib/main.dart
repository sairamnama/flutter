 import 'package:flutter/material.dart'; 
     
    void main() { 
      runApp(const MyApp()); 
    } 
     
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
     
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp(home: const Counter()); 
      } 
    } 
     
    class Counter extends StatefulWidget { 
      const Counter({super.key}); 
     
      @override 
      State<StatefulWidget> createState() => _CounterState(); 
    } 
     
    class _CounterState extends State<Counter> { 
      int _counter = 0; 
     
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Stateful Widget Demo')), 
          body: Center( 
            child: Row( 
              mainAxisSize: MainAxisSize.min, 
              children: [ 
                Text('$_counter', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)), 
                const SizedBox(width: 40), 
                IconButton( 
                  onPressed: () { 
                    setState(() { 
                      _counter++; 
                    }); 
                  }, 
                  icon: const Icon(Icons.add), 
                ), 
              ], 
            ), 
          ), 
        ); 
      } 
    }
