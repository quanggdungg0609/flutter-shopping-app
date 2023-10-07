import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem["imageUrl"] as String),
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Remove Product"),
                        titleTextStyle: Theme.of(context).textTheme.titleMedium,
                        content: const Text("Are you sure?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.red),
                              )),
                        ],
                      );
                    },
                  );
                },
              ),
              title: Text(
                cartItem["title"].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Size: ${cartItem["size"]}"),
            );
          }),
    );
  }
}
