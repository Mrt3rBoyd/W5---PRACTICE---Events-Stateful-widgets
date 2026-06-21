import 'package:flutter/material.dart';
import 'package:w6_practice/START-CODE/1%20-%20START%20CODE/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';
// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

// 	Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 16,
        height: 16,
        color: grocery.category.color,
      ),
      title: Text(grocery.name),
      
    );

  }
}
