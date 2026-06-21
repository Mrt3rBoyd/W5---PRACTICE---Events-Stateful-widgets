import 'package:flutter/material.dart';
import 'package:w6_practice/START-CODE/1%20-%20START%20CODE/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';

// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final nameControl = TextEditingController();
  final quanControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameControl,
            decoration: const InputDecoration(
              labelText: "Name of the grocery item",
            ),
          ),

          TextField(
            controller: quanControl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: 16),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              final name = nameControl.text;
              final quantity = int.tryParse(quanControl.text);

              if (name.isEmpty || quantity == null) {
                return;
              }

              
              final newItem = GroceryItem(
                id: DateTime.now().toString(),
                name: name,
                quantity: quantity,
                category: GroceryCategory.other,
              );
              Navigator.of(context).pop(newItem);
            },
            child: const Text("Add item"),
          ),
        ],
      ),
    );
  }
}
