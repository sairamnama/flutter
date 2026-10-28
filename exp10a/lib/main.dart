import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const MyApp()); 
    } 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return const MaterialApp( 
          debugShowCheckedModeBanner: false, 
          home: CounterScreen(), 
        ); 
      } 
    } 
    class CounterScreen extends StatefulWidget { 
      const CounterScreen({super.key}); 
      @override 
      State<CounterScreen> createState() => _CounterScreenState(); 
    } 
    class _CounterScreenState extends State<CounterScreen> { 
      int counter = 0; 
      void incrementCounter() { 
        setState(() { 
          counter++; 
        }); 
      } 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar( 
            title: const Text('Counter App'), 
          ), 
          body: Center( 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                const Text('Counter Value:'), 
                Text( 
                  '$counter', 
                  key: const Key('counterValue'), 
                  style: const TextStyle(fontSize: 30), 
                ), 
                ElevatedButton( 
                  key: const Key('incrementButton'), 
                  onPressed: incrementCounter, 
                  child: const Text('Increment'), 
                ), 
              ], 
            ), 
          ), 
     
     
        ); 
      } 
    } 
     
