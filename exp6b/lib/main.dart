import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const MyApp()); 
    } 
    // ---------------- MAIN APPLICATION ---------------- 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp( 
          title: 'Theming Demo', 
          debugShowCheckedModeBanner: false, 
          // ---------------- APPLICATION THEME ---------------- 
          theme: ThemeData( 
            brightness: Brightness.light, 
            // Main application color 
            primarySwatch: Colors.teal, 
            // Color scheme 
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, secondary: Colors.orange), 
            // Default font 
            fontFamily: 'Roboto', 
            // Text styles used throughout the application 
            textTheme: const TextTheme( 
              headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal), 
              bodyLarge: TextStyle(fontSize: 18, color: Colors.black87), 
              labelLarge: TextStyle(fontSize: 16, color: Colors.white), 
            ), 
            // Global ElevatedButton style 
            elevatedButtonTheme: ElevatedButtonThemeData( 
              style: ElevatedButton.styleFrom( 
                backgroundColor: Colors.teal, 
                foregroundColor: Colors.white, 
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
              ), 
            ), 
            // AppBar theme 
            appBarTheme: const AppBarTheme(backgroundColor: Colors.teal, foregroundColor: Colors.white, 
    centerTitle: true), 
          ), 
          home: const HomeScreen(), 
        ); 
      } 
    } 
    // ---------------- HOME SCREEN ---------------- 
    class HomeScreen extends StatelessWidget { 
      const HomeScreen({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        // Custom style which is NOT defined in ThemeData 
     
     
        const TextStyle customStyle = TextStyle( 
          fontSize: 20, 
          fontWeight: FontWeight.w600, 
          letterSpacing: 1.2, 
          color: Colors.deepPurple, 
        ); 
        return Scaffold( 
          appBar: AppBar(title: const Text('Flutter Theme Demo')), 
          body: Padding( 
            padding: const EdgeInsets.all(16), 
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [ 
                // Text using Theme 
                Text('Styled with Theme', style: Theme.of(context).textTheme.headlineLarge), 
                const SizedBox(height: 10), 
                // Another Text style from Theme 
                Text('Using the bodyLarge style from the app theme.', style:  
    Theme.of(context).textTheme.bodyLarge), 
                const SizedBox(height: 20), 
                // Text using custom style 
                const Text('Using a custom inline style.', style: customStyle), 
                const SizedBox(height: 30), 
                // Uses global ElevatedButton theme 
                ElevatedButton(onPressed: () {}, child: const Text('Themed Elevated Button')), 
                const SizedBox(height: 15), 
                // Custom button style 
                OutlinedButton( 
                  style: OutlinedButton.styleFrom( 
                    side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2), 
                    foregroundColor: Theme.of(context).colorScheme.secondary, 
                  ), 
                  onPressed: () {}, 
                  child: const Text('Custom Styled Outlined Button'), 
                ), 
              ], 
            ), 
          ), 
          // Uses theme color 
          floatingActionButton: FloatingActionButton( 
            onPressed: () {}, 
            backgroundColor: Theme.of(context).colorScheme.secondary, 
            child: const Icon(Icons.add), 
          ), 
        ); 
      } 
    }

