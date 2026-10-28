import 'package:flutter/material.dart'; 
    void main() { 
      runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LaptopProductsPage())); 
    } 
    // ---------------- CUSTOM PRODUCT WIDGET ---------------- 
    class Product extends StatelessWidget { 
      final String name; 
      final IconData icon; 
      final double price; 
      final VoidCallback onAddToCart; 
      const Product({super.key, required this.name, required this.icon, required this.price, required 
    this.onAddToCart}); 
      @override 
      Widget build(BuildContext context) { 
        return Card( 
          elevation: 3, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
          child: Padding( 
            padding: const EdgeInsets.all(12), 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                Icon(icon, size: 48, color: Colors.blue), 
                const SizedBox(height: 10), 
                Text( 
                  name, 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), 
                ), 
                const SizedBox(height: 6), 
                Text("₹${price.toStringAsFixed(2)}", style: TextStyle(fontSize: 13, color: Colors.grey[700])), 
                const SizedBox(height: 8), 
                ElevatedButton(onPressed: onAddToCart, child: const Text("Add to Cart")), 
              ], 
            ), 
          ), 
        ); 
      } 
    } 
    // ---------------- PRODUCT DISPLAY PAGE ---------------- 
    class LaptopProductsPage extends StatelessWidget { 
      LaptopProductsPage({super.key}); 
      final List<Map<String, dynamic>> laptops = [ 
        {'name': 'HP Pavilion 15', 'icon': Icons.laptop, 'price': 67990.0}, 
        {'name': 'Dell Inspiron 14', 'icon': Icons.laptop_mac, 'price': 58999.0}, 
        {'name': 'Samsung Galaxy Book3', 'icon': Icons.devices, 'price': 71999.0}, 
      ]; 
      void _showSnackBar(BuildContext context, String name) { 
        ScaffoldMessenger.of( 
          context, 
        ).showSnackBar(SnackBar(content: Text('$name added to cart!'), duration: const Duration(seconds: 1))); 
     
     
      } 
      @override 
      Widget build(BuildContext context) { 
        // Determine number of columns based on screen width 
        int columns = (MediaQuery.of(context).size.width / 448).floor(); 
        if (columns < 1) { 
          columns = 1; 
        } 
        return Scaffold( 
          appBar: AppBar(title: const Text("Laptops on Amazon.in")), 
          body: GridView.builder( 
            padding: const EdgeInsets.all(8), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
              crossAxisCount: columns, 
              crossAxisSpacing: 8, 
              mainAxisSpacing: 8, 
              childAspectRatio: 0.85, 
            ), 
            itemCount: laptops.length, 
            itemBuilder: (context, index) { 
              final laptop = laptops[index]; 
              return Product( 
                name: laptop['name'], 
                icon: laptop['icon'], 
                price: laptop['price'], 
                onAddToCart: () { 
                  _showSnackBar(context, laptop['name']); 
                }, 
              ); 
            }, 
          ), 
        ); 
      } 
    }