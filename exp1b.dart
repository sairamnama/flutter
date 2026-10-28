  // Experiment 1 b) Write a simple Dart program to understand the language basics. 
  import 'dart:io'; 
  import 'dart:math'; 
     
    void main() { 
      print("--- WELCOME TO SIMPLIFIED DART INPUTS ---"); 

     
     
     
      // 1. Reading Simple Variables 
      int a = readInt("Enter an integer (a): "); 
      double b = readDouble("Enter a double (b): "); 
      num c = readDouble("Enter any number (c): "); 
      String d = readString("Enter a string (d): "); 
     
      // 2. Conditional Logic 
      if (a > 10) 
        print("a is greater than 10"); 
      else 
        print("a is less than or equal to 10"); 
     
      switch (a) { 
        case 10: 
          print("ten"); 
        case 20: 
          print("twenty"); 
      } 
     
      // 3. Simple Loop Input 
      int loops = readInt("How many times to loop? "); 
      for (int j = 0; j < loops; j++) print("Hello World"); 
     
      // 4. Fibonacci Function Call 
      int fibTerm = readInt("Enter Fibonacci term index: "); 
      print("$fibTerm-th fibonacci term is ${fibonacci(fibTerm)}"); 
     
      // 5. Math Import Test 
      double degrees = readDouble("Enter degrees for Sin calculation: "); 
      print('sin($degrees) value is ${sin(degrees * (pi / 180))}'); 
     
      // 6. Creating Objects dynamically 
      print("\n--- Setup Point X ---"); 
      Point X = Point(readInt("X coordinate: "), readInt("Y coordinate: ")); 
     
      print("--- Setup Point Y ---"); 
      Point Y = Point(readInt("X coordinate: "), readInt("Y coordinate: ")); 
     
      print('Distance between X and Y is ${X.difference(Y)}'); 
     
      // 7. Exception Handling 
      try { 
        dontCallMe(); 
      } on Exception catch (e) { 
        print('Caught expected exception - $e'); 
      } 
     
      // 8. Simplified Enum Selection 
      print("\nPick a Color: 0 for RED, 1 for GREEN, 2 for BLUE"); 
      int choice = readInt("Choice: "); 
      Color col = (choice >= 0 && choice < Color.values.length) ? Color.values[choice] : Color.RED; 
      print("Selected color enum is: ${col.name}"); 
     
     
    } 
     
    String readString(String prompt) { 
      stdout.write(prompt); 
      return stdin.readLineSync() ?? ''; 
    } 
     
    int readInt(String prompt) { 
      stdout.write(prompt); 
      return int.tryParse(stdin.readLineSync() ?? '') ?? 0; // Returns 0 if input is invalid 
    } 
     
    double readDouble(String prompt) { 
      stdout.write(prompt); 
      return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0; // Returns 0.0 if input is invalid 
    } 
     
    int fibonacci(int n) { 
      if (n == 0 || n == 1) return n; 
      return fibonacci(n - 1) + fibonacci(n - 2); 
    } 
     
    class Point { 
      int x, y; 
      Point(this.x, this.y); 
    double difference(Point other) => sqrt(pow((x - other.x), 2) + pow((y - other.y), 2));} 
    void dontCallMe() => throw Exception('Why did you call me?'); 
    enum Color { RED, GREEN, BLUE  
    } 