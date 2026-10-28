 import 'package:flutter/material.dart'; 
    void main() { 
      runApp(MaterialApp(title: 'Navigation Demo App', home: const FirstPage())); 
    } 
    class FirstPage extends StatelessWidget { 
      const FirstPage({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Hello World')), 
          body: Center( 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                ElevatedButton( 
                  onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage())); 
                  }, 
                  child: const Text('Next Page'), 
                ), 
                const SizedBox(height: 16), 
                ElevatedButton( 
                  onPressed: () { 
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hello, World!'))); 
                  }, 
                  child: const Text('Msg'), 
                ), 
              ], 
            ), 
          ), 
        ); 
      } 
    } 
     
    class SecondPage extends StatelessWidget { 
      const SecondPage({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Second Page')), 
          body: Center( 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                const Text('This is the second page'), 
                const SizedBox(height: 16), 
                ElevatedButton( 
                  onPressed: () { 
                    if (Navigator.canPop(context)) { 
                      Navigator.pop(context); 
     
     
                    } else {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("No back history item"),
    ),
  );
}
                  }, 
                  child: const Text('Go Back'), 
                ), 
              ], 
            ), 
          ), 
        ); 
      } 
    }

