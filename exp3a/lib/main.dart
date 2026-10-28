 import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const MyApp()); 
    } 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp(debugShowCheckedModeBanner: false, home: const ItemListPage()); 
      } 
    } 
     
    class ItemListPage extends StatelessWidget { 
      const ItemListPage({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Responsive Item List')), 
          body: LayoutBuilder( 
            builder: (context, constraints) { 
              // Mobile / small screen 
              if (constraints.maxWidth < 768) { 
                return ListView.builder( 
                  itemCount: 50, 
                  itemBuilder: (context, index) { 
                    return ListTile(leading: const Icon(Icons.add_box), title: Text('Item $index')); 
                  }, 
                ); 
              } 
              // Tablet / large screen 
              return GridView.builder( 
                padding: const EdgeInsets.all(10), 
                itemCount: 50, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 10, 
                  childAspectRatio: 4, 
                ), 
                itemBuilder: (context, index) { 
                  return Card( 
                    child: ListTile(leading: const Icon(Icons.add_box), title: Text('Item $index')), 
                  ); 
                }, 
              ); 
            }, 
          ), 
        ); 
      } 
    }

