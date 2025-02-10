import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: 5, // Example item count, replace with your dynamic data
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4.0,
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blue),
              title: Text("Service Order #${index + 1}"),
              subtitle: const Text("Status: Active"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to Order Details page when implemented
              },
            ),
          );
        },
      ),
    );
  }
}
