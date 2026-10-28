import 'dart:convert'; 
    import 'package:flutter/material.dart'; 
    import 'package:http/http.dart' as http; 
    // Model class 
    class Post { 
      final int id; 
      final String title; 
      final String body; 
      Post({required this.id, required this.title, required this.body}); 
      factory Post.fromJson(Map<String, dynamic> json) { 
        return Post(id: json['id'], title: json['title'], body: json['body']); 
      } 
    } 
    void main() { 
      runApp(const MyApp()); 
    } 
    class MyApp extends StatelessWidget { 
      const MyApp({super.key}); 
      @override 
      Widget build(BuildContext context) { 
        return MaterialApp(debugShowCheckedModeBanner: false, title: 'REST API Demo', home: const 
    PostsScreen()); 
      } 
    } 
    class PostsScreen extends StatefulWidget { 
      const PostsScreen({super.key}); 
      @override 
      State<PostsScreen> createState() => _PostsScreenState(); 
    } 
    class _PostsScreenState extends State<PostsScreen> { 
      late Future<List<Post>> futurePosts; 
      @override 
      void initState() { 
        super.initState(); 
        futurePosts = fetchPosts(); 
      } 
     
     
     
      // Fetch data from REST API 
      Future<List<Post>> fetchPosts() async { 
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')); 
        if (response.statusCode == 200) { 
          final List<dynamic> jsonResponse = jsonDecode(response.body); 
          return jsonResponse.map((post) => Post.fromJson(post)).toList(); 
        } else { 
          throw Exception('Failed to load posts'); 
        } 
      } 
      // Refresh data 
      void refreshPosts() { 
        setState(() { 
          futurePosts = fetchPosts(); 
        }); 
      } 
      @override 
      Widget build(BuildContext context) { 
        return Scaffold( 
          appBar: AppBar( 
            title: const Text('Posts from REST API'), 
            actions: [IconButton(onPressed: refreshPosts, icon: const Icon(Icons.refresh))], 
          ), 
          body: FutureBuilder<List<Post>>( 
            future: futurePosts, 
            builder: (context, snapshot) { 
              // Loading 
              if (snapshot.connectionState == ConnectionState.waiting) { 
                return const Center(child: CircularProgressIndicator()); 
              } 
              // Error 
              if (snapshot.hasError) { 
                return Center( 
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [ 
                      const Icon(Icons.error_outline, size: 60, color: Colors.red), 
                      const SizedBox(height: 10), 
                      Text('Error: ${snapshot.error}', textAlign: TextAlign.center), 
                      const SizedBox(height: 10), 
                      ElevatedButton(onPressed: refreshPosts, child: const Text('Retry')), 
                    ], 
                  ), 
                ); 
              } 
              // No data 
              if (!snapshot.hasData || snapshot.data!.isEmpty) { 
                return const Center(child: Text('No data found')); 
              } 
              // Display data 
              final posts = snapshot.data!; 
              return ListView.builder( 
                itemCount: posts.length, 
     
     
                itemBuilder: (context, index) { 
                  final post = posts[index]; 
                  return Card( 
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
                    child: ListTile( 
                      leading: CircleAvatar(child: Text('${post.id}')), 
                      title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)), 
                      subtitle: Padding(padding: const EdgeInsets.only(top: 8), child: Text(post.body)), 
                    ), 
                  ); 
                }, 
              ); 
            }, 
          ), 
        ); 
      } 
    }
