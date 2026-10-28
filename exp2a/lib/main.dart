 import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const MyApp()); 
    } 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp( 
          debugShowCheckedModeBanner: false, 
          home: Scaffold( 
            appBar: AppBar(title: const Text('Text, Image and Container')), 
            body: Padding( 
              padding: const EdgeInsets.all(20.0), 
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [ 
                  // -------------------------------- 
                  // TEXT WIDGET 
                  // -------------------------------- 
                  const Text( 
                    'Hello, Flutter!', 
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple), 
                  ), 
                  const SizedBox(height: 15), 
                  const Text( 
                    'Explore Flutter Widgets', 
                    textAlign: TextAlign.center, 
                    style: TextStyle( 
                      fontSize: 18, 
                      fontStyle: FontStyle.italic, 
                      letterSpacing: 1.0, 
                      decoration: TextDecoration.underline, 
                    ), 
                  ), 
                  const SizedBox(height: 25), 
                  // -------------------------------- 
                  // IMAGE WIDGET 
                  // -------------------------------- 
                  Image.network( 
                    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg', 
                    width: 200, 
                    height: 150, 
                    fit: BoxFit.cover, 
                    errorBuilder: (context, error, stackTrace) { 
                      return const Text('Image could not be loaded'); 
                    }, 
                  ), 
                  const SizedBox(height: 25), 
                   
     
     
     
      // -------------------------------- 
                  // CONTAINER WIDGET 
                  // -------------------------------- 
                  Container( 
                    width: double.infinity, 
                    padding: const EdgeInsets.all(20), 
                    margin: const EdgeInsets.symmetric(horizontal: 10), 
                    alignment: Alignment.center, 
                    decoration: BoxDecoration( 
                      color: Colors.lightBlue[100], 
                      border: Border.all(color: Colors.blue, width: 2), 
                      borderRadius: BorderRadius.circular(15), 
                    ), 
                    child: const Text('This is a Container', style: TextStyle(fontSize: 20, fontWeight: 
    FontWeight.bold)), 
                  ), 
                ], 
              ), 
            ), 
          ), 
        ); 
      } 
    }

