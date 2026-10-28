
    import 'package:flutter/material.dart'; 
    void main() { 
      runApp(const MyApp()); 
    } 
    // ---------------- MAIN APP ---------------- 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp(debugShowCheckedModeBanner: false, title: 'Simple Form', home: const 
    SimpleForm()); 
      } 
    } 
    // ---------------- FORM ---------------- 
    class SimpleForm extends StatefulWidget { 
      const SimpleForm({super.key}); 
      @override 
      State<SimpleForm> createState() => _SimpleFormState(); 
    } 
    class _SimpleFormState extends State<SimpleForm> { 
      // Form key 
      final _formKey = GlobalKey<FormState>(); 
      // Controllers 
      final nameController = TextEditingController(); 
      final emailController = TextEditingController(); 
      final passwordController = TextEditingController(); 
      @override 
      void dispose() { 
        nameController.dispose(); 
        emailController.dispose(); 
        passwordController.dispose(); 
        super.dispose(); 
      } 
      // ---------------- SUBMIT FORM ---------------- 
      void submitForm() { 
        if (_formKey.currentState!.validate()) { 
          final name = nameController.text; 
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hello $name! Form submitted successfully!'))); 
        } 
      } 
      // ---------------- UI ---------------- 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar(title: const Text('Simple Form')), 
          body: Padding( 
            padding: const EdgeInsets.all(16), 
            child: Form( 
              key: _formKey, 
     
     
              child: Column( 
                children: [ 
                  // -------- NAME -------- 
                  TextFormField( 
                    controller: nameController, 
                    decoration: const InputDecoration( 
                      labelText: 'Name', 
                      prefixIcon: Icon(Icons.person), 
                      border: OutlineInputBorder(), 
                    ), 
                    validator: (value) { 
                      if (value == null || value.trim().isEmpty) { 
                        return 'Please enter your name'; 
                      } 
                      return null; 
                    }, 
                  ), 
                  const SizedBox(height: 16), 
                  // -------- EMAIL -------- 
                  TextFormField( 
                    controller: emailController, 
                    keyboardType: TextInputType.emailAddress, 
                    decoration: const InputDecoration( 
                      labelText: 'Email', 
                      prefixIcon: Icon(Icons.email), 
                      border: OutlineInputBorder(), 
                    ), 
                    validator: (value) { 
                      if (value == null || value.trim().isEmpty) { 
                        return 'Please enter your email'; 
                      } 
                      if (!value.contains('@')) { 
                        return 'Enter a valid email'; 
                      } 
                      return null; 
                    }, 
                  ), 
                  const SizedBox(height: 16), 
                  // -------- PASSWORD -------- 
                  TextFormField( 
                    controller: passwordController, 
                    obscureText: true, 
                    decoration: const InputDecoration( 
                      labelText: 'Password', 
                      prefixIcon: Icon(Icons.lock), 
                      border: OutlineInputBorder(), 
                    ), 
                    validator: (value) { 
                      if (value == null || value.isEmpty) { 
                        return 'Please enter your password'; 
                      } 
                      if (value.length < 6) { 
                        return 'Password must be at least 6 characters'; 
     
     
                      } 
                      return null; 
                    }, 
                  ), 
                  const SizedBox(height: 24), 
                  // -------- SUBMIT -------- 
                  SizedBox( 
                    width: double.infinity, 
                    child: ElevatedButton(onPressed: submitForm, child: const Text('Submit')), 
                  ), 
                ], 
              ), 
            ), 
          ), 
        ); 
      } 
    }