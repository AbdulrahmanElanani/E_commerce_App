import 'package:e_commerce_app/provider/cart.dart';
import 'package:e_commerce_app/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: appbarGreen,
        title: const Text(
          'Check out',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        actions: [
          Consumer<Cart>(builder: ((context, cart, child) {
            return Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 164, 255, 193),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cart.selectedProduct.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart),
                      style: const ButtonStyle(
                          iconColor: WidgetStatePropertyAll(Colors.white),
                          iconSize: WidgetStatePropertyAll(18)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    '\$ ${cart.price.round()}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            );
          })),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 600,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cart.selectedProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      subtitle: Text(
                          '\$${cart.selectedProduct[index].price} - ${cart.selectedProduct[index].location}'),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(cart.selectedProduct[index].imgPath),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          cart.remove(cart.selectedProduct[index]);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      title: Text(cart.selectedProduct[index].name),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(btnPink),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.all(12),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Text(
              'Pay \$${cart.price}',
              style: const TextStyle(fontSize: 19,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
