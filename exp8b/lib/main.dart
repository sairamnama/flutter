import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const AnimationDemoApp()); 
    } 
    class AnimationDemoApp extends StatelessWidget { 
      const AnimationDemoApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp( 
          debugShowCheckedModeBanner: false, 
          title: 'Flutter Animations', 
          home: const AnimationDemoScreen(), 
        ); 

     
     
      } 
    } 
    class AnimationDemoScreen extends StatefulWidget { 
      const AnimationDemoScreen({super.key}); 
      @override 
      State<AnimationDemoScreen> createState() => _AnimationDemoScreenState(); 
    } 
    class _AnimationDemoScreenState extends State<AnimationDemoScreen> with 
    SingleTickerProviderStateMixin { 
      // Fade animation 
      bool _visible = true; 
      // Explicit animation controller 
      late AnimationController _controller; 
      late Animation<Offset> _slideAnimation; 
      @override 
      void initState() { 
        super.initState(); 
        _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this); 
        _slideAnimation = Tween<Offset>( 
          begin: const Offset(-2.0, 0.0), 
          end: Offset.zero, 
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); 
        // Start slide animation when screen opens 
        _controller.forward(); 
      } 
      @override 
      void dispose() { 
        _controller.dispose(); 
        super.dispose(); 
      } 
      // Fade 
      void _toggleFade() { 
        setState(() { 
          _visible = !_visible; 
        }); 
      } 
      // Slide 
      void _toggleSlide() { 
        if (_controller.status == AnimationStatus.completed) { 
          _controller.reverse(); 
        } else { 
          _controller.forward(); 
        } 
      } 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Flutter Animation Demo')), 
          body: SingleChildScrollView( 
            child: Padding( 
              padding: const EdgeInsets.all(20), 
              child: Column( 
                children: [ 
     
     
                  // ---------------- FADE ---------------- 
                  const Text('1. Fade Animation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
                  const SizedBox(height: 10), 
                  AnimatedOpacity( 
                    opacity: _visible ? 1.0 : 0.0, 
                    duration: const Duration(seconds: 1), 
                    child: Container( 
                      width: 150, 
                      height: 120, 
                      color: Colors.blue, 
                      alignment: Alignment.center, 
                      child: const Text('Fade Me', style: TextStyle(color: Colors.white, fontSize: 18)), 
                    ), 
                  ), 
                  ElevatedButton(onPressed: _toggleFade, child: Text(_visible ? 'Fade Out' : 'Fade In')), 
                  const Divider(height: 40), 
                  // ---------------- SLIDE ---------------- 
                  const Text('2. Slide Animation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
                  const SizedBox(height: 10), 
                  SlideTransition( 
                    position: _slideAnimation, 
                    child: Container( 
                      width: 150, 
                      height: 120, 
                      color: Colors.green, 
                      alignment: Alignment.center, 
                      child: const Text('Slide Me', style: TextStyle(color: Colors.white, fontSize: 18)), 
                    ), 
                  ), 
                  ElevatedButton(onPressed: _toggleSlide, child: const Text('Slide Toggle')), 
                  const Divider(height: 40), 
                  // ---------------- SCALE ---------------- 
                  const Text('3. Scale Animation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
                  const SizedBox(height: 10), 
                  AnimatedScale( 
                    scale: _visible ? 1.0 : 0.4, 
                    duration: const Duration(seconds: 1), 
                    curve: Curves.easeInOut, 
                    child: const Icon(Icons.star, size: 100, color: Colors.orange), 
                  ), 
                  const Divider(height: 40), 
                  // ---------------- ROTATION ---------------- 
                  const Text('4. Rotation Animation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
                  const SizedBox(height: 10), 
                  AnimatedRotation( 
                    turns: _visible ? 0.0 : 1.0, 
                    duration: const Duration(seconds: 1), 
                    curve: Curves.easeInOut, 
                    child: const Icon(Icons.refresh, size: 100, color: Colors.purple), 
                  ), 
                  const SizedBox(height: 20), 
                  ElevatedButton(onPressed: _toggleFade, child: const Text('Scale & Rotate')), 
                ], 
     
     
              ), 
            ), 
          ), 
        ); 
      } 
    }

