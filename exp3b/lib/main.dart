import 'package:flutter/material.dart'; 
     
    void main() { 
      runApp(const MyApp()); 
    } 
     
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
     
      @override 
      Widget build(BuildContext context) { 
        return const MaterialApp(debugShowCheckedModeBanner: false, home: ResponsivePage()); 
      } 
    } 
     
    class ResponsivePage extends StatelessWidget { 
      const ResponsivePage({super.key}); 
     
      @override 
      Widget build(BuildContext context) { 
        // Get screen information using MediaQuery 
        double width = MediaQuery.of(context).size.width; 
        double height = MediaQuery.of(context).size.height; 
        String orientation = MediaQuery.of(context).orientation.name; 

     
     
     
        // Breakpoints 
        int columns; 
     
        if (width < 600) { 
          columns = 1; // Mobile 
        } else if (width < 1024) { 
          columns = 2; // Tablet 
        } else { 
          columns = 3; // Desktop 
        } 
     
        return Scaffold( 
          appBar: AppBar(title: const Text('Responsive UI')), 
     
          body: Column( 
            children: [ 
              // Display screen information 
              Padding( 
                padding: const EdgeInsets.all(15), 
                child: Text( 
                  'Width: ${width.toStringAsFixed(0)}\n' 
                  'Height: ${height.toStringAsFixed(0)}\n' 
                  'Orientation: $orientation', 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
                ), 
              ), 
     
              // Responsive layout 
              Expanded( 
                child: GridView.count( 
                  padding: const EdgeInsets.all(20), 
                  crossAxisCount: columns, 
                  crossAxisSpacing: 15, 
                  mainAxisSpacing: 15, 
     
                  children: List.generate(6, (index) { 
                    return Card( 
                      child: Center( 
                        child: Text('Item ${index + 1}', style: const TextStyle(fontSize: 20, fontWeight: 
    FontWeight.bold)), 
                      ), 
                    ); 
                  }), 
                ), 
              ), 
            ], 
          ), 
        ); 
      } 
    }

