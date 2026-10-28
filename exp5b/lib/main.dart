import 'package:provider/provider.dart'; 
     
    import 'package:flutter/material.dart'; 
    import 'package:provider/provider.dart'; 
    void main() { 
      runApp(const MyApp()); 
    } 
    // Provider Model 
    class CounterModel with ChangeNotifier { 
      int _counter = 0; 
      void increment() { 
        _counter++; 
        notifyListeners(); 
      } 
      void decrement() { 
        _counter--; 
        notifyListeners(); 
      } 
      int get currentCount => _counter; 
    } 
    // Root StatelessWidget 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp( 
          debugShowCheckedModeBanner: false, 
          home: ChangeNotifierProvider(create: (context) => CounterModel(), child: const DemoPage()), 
        ); 
      } 
    } 
    // StatefulWidget for setState example 
    class DemoPage extends StatefulWidget { 
      const DemoPage({super.key}); 
      @override 
      State<DemoPage> createState() => _DemoPageState(); 
    } 
    class _DemoPageState extends State<DemoPage> { 
      // State managed using setState 
      int localCounter = 0; 
      @override 
      Widget build(BuildContext context) { 
        final counter = Provider.of<CounterModel>(context); 
        return Scaffold( 
          appBar: AppBar(title: const Text('setState and Provider')), 
          body: Center( 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                // setState 
     
     
                const Text('Using setState', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
                const SizedBox(height: 10), 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    ElevatedButton( 
                      onPressed: () { 
                        setState(() { 
                          localCounter--; 
                        }); 
                      }, 
                      child: const Text('-1'), 
                    ), 
                    const SizedBox(width: 30), 
                    Text('$localCounter', style: const TextStyle(fontSize: 30)), 
                    const SizedBox(width: 30), 
                    ElevatedButton( 
                      onPressed: () { 
                        setState(() { 
                          localCounter++; 
                        }); 
                      }, 
                      child: const Text('+1'), 
                    ), 
                  ], 
                ), 
                const SizedBox(height: 50), 
                // Provider 
                const Text('Using Provider', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
                const SizedBox(height: 10), 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    ElevatedButton(onPressed: () => counter.decrement(), child: const Text('-1')), 
                    const SizedBox(width: 30), 
                    Text('${counter.currentCount}', style: const TextStyle(fontSize: 30)), 
                    const SizedBox(width: 30), 
                    ElevatedButton(onPressed: () => counter.increment(), child: const Text('+1')), 
                  ], 
                ), 
              ], 
            ), 
          ), 
        ); 
      } 
    }