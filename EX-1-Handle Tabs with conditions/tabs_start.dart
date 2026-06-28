import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Blue Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs defaultTab = AppTabs.red;

  Widget get content {
    switch (defaultTab) {
      case AppTabs.red:
        return RedScreen();
      case AppTabs.green:
        return GreenScreen();
      case AppTabs.blue:
        return BlueScreen();
    }
  }
  void changeTab(AppTabs tab) { 
    setState(() {
      defaultTab = tab;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton( 
              onPressed: () => changeTab(AppTabs.red), 
              icon: Icon(Icons.home, color: Colors.red,),
            ),

            IconButton(
              onPressed: () => changeTab(AppTabs.green),
              icon: Icon(Icons.home, color: Colors.green),
            ),
            IconButton( 
              onPressed: () => changeTab(AppTabs.blue), 
              icon: Icon(Icons.home, color: Colors.blue,),
            ),
              

          ],
        ),
      ),
    );
  }
}





void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
