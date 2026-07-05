import 'package:flutter/material.dart';
import '../models/button_status.dart';
import '../data/button_repositories.dart';



class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  final ButtonRepository repository = ButtonRepository();

  ButtonStatus? button;
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();

    _fetchButtonData();
  }

  Future<void> _fetchButtonData() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final result = await repository.getButtonStatus();

      setState(() {
        button = result;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(
        
        body: Center(
          child: Text(error!, style: const TextStyle(color: Colors.red)),
        ),
      );
    }

    return Scaffold(
     
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: button!.selected ? Colors.white : Colors.blue,
            
            minimumSize: const Size(220, 60),
          ),
          onPressed: () {},
          child: Text(button!.title, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
