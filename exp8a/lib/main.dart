    import 'dart:math'; 
    import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const AnimationDemoApp()); 
    } 
    class AnimationDemoApp extends StatelessWidget { 
      const AnimationDemoApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp(debugShowCheckedModeBanner: false, title: 'Flutter Animation', home: const 
    AnimationDemo()); 
      } 
    } 
    class AnimationDemo extends StatefulWidget { 
      const AnimationDemo({super.key}); 
      @override 
      State<AnimationDemo> createState() => _AnimationDemoState(); 
    } 
    class _AnimationDemoState extends State<AnimationDemo> with SingleTickerProviderStateMixin { 
      // Values for implicit animations 
      double _fontSize = 50; 
      Color _fontColor = Colors.blue; 
      double _boxSize = 100; 
      Color _boxColor = Colors.blue; 
      BorderRadiusGeometry _borderRadius = BorderRadiusGeometry.circular(25); 
      final Random random = Random(); 
      // Explicit animation controller 
      late AnimationController _controller; 
      late Animation<double> _rotationAnimation; 
      @override 
      void initState() { 
        super.initState(); 
        _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1)); 
        _rotationAnimation = Tween<double>( 
          begin: 0.0, 
          end: 2 * pi, 
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); 
      } 
      void _animateUI() { 
        setState(() { 
          _fontSize = 20 + random.nextInt(80).toDouble(); 
          _boxSize = 100 + random.nextInt(300).toDouble(); 
          _boxColor = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0); 
          _fontColor = _boxColor; 
          _borderRadius = BorderRadiusGeometry.circular(random.nextInt(25).toDouble()); 
        }); 
        // Start explicit rotation animation 
        _controller.forward(from: 0.0); 
      } 
      @override 
      void dispose() { 
     
     
        _controller.dispose(); 
        super.dispose(); 
      } 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Flutter Animation')), 
          body: Center( 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                // Explicit animation 
                AnimatedBuilder( 
                  animation: _rotationAnimation, 
                  builder: (context, child) { 
                    return Transform.rotate(angle: _rotationAnimation.value, child: child); 
                  }, 
                  child: const Icon(Icons.flutter_dash, size: 80, color: Colors.blue), 
                ), 
                const SizedBox(height: 30), 
                // Implicit animation - Container 
                AnimatedContainer( 
                  width: _boxSize, 
                  height: _boxSize, 
                  decoration: BoxDecoration(color: _boxColor, borderRadius: _borderRadius), 
                  duration: const Duration(seconds: 1), 
                  curve: Curves.easeInOut, 
                ), 
                const SizedBox(height: 30), 
                // Implicit animation - Text style 
                AnimatedDefaultTextStyle( 
                  duration: const Duration(milliseconds: 600), 
                  curve: Curves.easeInOut, 
                  style: TextStyle(fontSize: _fontSize, color: _fontColor, fontWeight: FontWeight.bold), 
                  child: const Text('Flutter Rocks!'), 
                ), 
              ], 
            ), 
          ), 
          floatingActionButton: FloatingActionButton(onPressed: _animateUI, child: const 
    Icon(Icons.play_arrow)), 
        ); 
      } 
    }
