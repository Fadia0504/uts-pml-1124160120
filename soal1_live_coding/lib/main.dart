import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Fadia Nurcholifah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.system,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar:AppBar(
        title: Text('Profil Fadia Nurcholifah'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 48,
                  child: Icon(Icons.person, 
                  size: 48
                  ),
                
                ),
                const SizedBox(height: 16),
                Text('Fadia Nurcholifah', 
                style: textTheme.headlineSmall,
                textAlign: TextAlign.center
                ),
                const SizedBox(height: 4),
                Text('NIM: 1124160120',
                style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text('Teknik Informatika',
                style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}