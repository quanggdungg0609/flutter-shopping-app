import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        "id": widget.product["id"],
        "title": widget.product["title"],
        "price": widget.product["price"],
        "imageUrl": widget.product["imageUrl"],
        "company": widget.product["company"],
        "size": selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added succesful!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select size !")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              (widget.product["title"] as String),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              (widget.product["imageUrl"] as String),
              height: 250,
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(widget.product['price'] as double)} €",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product["sizes"] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 199, 199, 199),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(350, 50)),
                    onPressed: onTap,
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
